class MCP::Base::Page < MCP::Base
  NESTABLE = false

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
      line = line.strip

      if line.match(self.class::TITLE_REGEX)
        set_title(line)
      elsif indent_parameters[:indentation] < current_indentation && indent_parameters[:object]
        indent_parameters[:object].parse_line(line)
      elsif line.match(choice_class::REGEX)
        indent_parameters[:object] = choice_class.new(line)
        indent_parameters[:indentation] = current_indentation

        @choices << indent_parameters[:object]
      elsif line.match(conditional_class::REGEX)
        #TODO conditionals are not getting their "then" objects assigned properly. Instead they are just becoming
        # more options within the choice. We need to use indentation to go up n levels of objects to properly assign these.
        indent_parameters[:object] = conditional_class.new(line)
        indent_parameters[:indentation] = current_indentation

        @choices << indent_parameters[:object]
      elsif line.match(variable_class::REGEX)
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

  def conditional_class
    (module_name + "::Conditional").constantize
  end
end
