class MCP::Base::Conditional < MCP::Base
  NESTABLE = true

  attr_accessor :if, :then, :body

  def initialize(line)
    @if = line.body
    @then = []
    @body = ""
  end

  def parse_line(line)
    line.command_class_instance ? @then << line.command_class_instance : @body << line.text
  end
end
