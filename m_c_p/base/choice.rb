class MCP::Base::Choice < MCP::Base
  NESTABLE = true

  attr_accessor :options

  def initialize(line)
    @line = line
    @options = []
    @indent_parameters = { object: nil, indentation: @line.indentation }
  end

  def parse_line(line)
    @test = line
    command_instance = line.command_class&.new(line)

    if @indent_parameters[:indentation] < line.indentation && @indent_parameters[:object]
      @indent_parameters[:object].parse_line(line)
    elsif line.command_class
      command_instance = line.command_class.new(line)

      @indent_parameters[:object] = command_instance if line.nestable?
      @indent_parameters[:indentation] = line.indentation if line.nestable?
      append_to_instance_variable(line.command_class, command_instance)
    end
  end
end
