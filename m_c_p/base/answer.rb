class MCP::Base::Answer < MCP::Base
  NESTABLE = true

  attr_accessor :text, :then

  def initialize(line)
    @line = line
    @then = []
  end

  def parse_line(line)
    @then << line.command_class&.new(line)
  end
end
