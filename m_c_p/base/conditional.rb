class MCP::Base::Conditional < MCP::Base
  NESTABLE = true

  attr_accessor :expression, :then, :then_body, :else, :else_body, :label

  def initialize(line)
    @line = line
    parse_expression
    @then = []
    @then_body = ''
  end

  def parse_line(line)
    line.command_class ? @then << line.command_class.new(line) : @then_body << line.text
  end

  def parse_expression
    @expression, @label = @line.body.split('#')
  end
end
