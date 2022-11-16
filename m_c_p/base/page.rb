class MCP::Base::Page < MCP::Base
  attr_accessor :story, :title, :body, :variables, :choices

  def initialize(story, page_text)
    @story = story
    @variables = []
    @choices = []
    @body = ""
    parse_text(page_text)
  end


  private

  def parse_text(page_text)
    indent_parameters = { object: nil, indentation: 0 }

    page_text.each_line do |line|
      current_indentation = indentation_count(line)

      if line.match(self.class::TITLE_REGEX)
        set_title(line)
      elsif indent_parameters[:indentation] < current_indentation && indent_parameters[:object]
        indent_parameters[:object].parse_line(line)
      elsif line.match(choice_class::SETTER_REGEX)
        indent_parameters[:object] = choice_class.new(line)
        indent_parameters[:indentation] = current_indentation

        @choices << indent_parameters[:object]
      elsif line.match(variable_class::SETTER_REGEX)
        @variables << variable_class.new(line)
      else
        @body << line
      end
    end
  end

  def set_title(line)
    @title = line.split(' ')[1..].join(" ")
  end

  def variable_class
    (module_name + "::Variable").constantize
  end

  def choice_class
    (module_name + "::Choice").constantize
  end
end
