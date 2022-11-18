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

    page_text.each_line.each_with_index do |line_text, index|
      if index == 0
        set_title(line_text)
        next
      end

      line = MCP::Base::Line.new(line_text, module_name.constantize, index)
      @line = line
      @indent = indent_parameters

      if indent_parameters[:indentation] < line.indentation && indent_parameters[:object]
        indent_parameters[:object].parse_line(line)
      elsif line.command_class
        command_instance = line.command_class.new(line)

        indent_parameters[:object] = command_instance if line.nestable?
        indent_parameters[:indentation] = line.indentation if line.nestable?
        append_to_instance_variable(line.command_class, command_instance)
      else
        @body << line.text
      end
    end
  rescue => e
    binding.irb
    raise e
  end

  def set_title(line)
    @title = line.split(' ')[1..].join(" ")
  end
end
