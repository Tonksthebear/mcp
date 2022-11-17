class MCP::Base::Goto < MCP::Base
  NESTABLE = true

  attr_accessor :label

  def initialize(label)
    @label = strip_regex_match(label)
  end

end
