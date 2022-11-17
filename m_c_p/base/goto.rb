class MCP::Base::Goto < MCP::Base
  NESTABLE = true

  attr_accessor :label

  def initialize(label)
    @label = label.sub(label.match(self.class::REGEX)[0],'').strip
  end

end
