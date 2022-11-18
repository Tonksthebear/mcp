class MCP::Base::Choice < MCP::Base
  NESTABLE = true

  attr_accessor :options

  def initialize(line)
    @line = line
    @options = []
  end

  def parse_line(line)
    @test = line
    command_instance = line.command_class&.new(line)

    @options << command_instance if command_instance
  end
end
