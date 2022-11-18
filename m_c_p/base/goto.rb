class MCP::Base::Goto < MCP::Base
  NESTABLE = true

  attr_accessor :label

  def initialize(line)
    @label = line.body
  end
end
