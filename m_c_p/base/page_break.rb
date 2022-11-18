class MCP::Base::PageBreak < MCP::Base
  NESTABLE = false

  def initialize(line)
    @line = line
  end
end
