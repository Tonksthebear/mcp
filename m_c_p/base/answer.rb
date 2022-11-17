class MCP::Base::Answer < MCP::Base
  NESTABLE = true

  attr_accessor :text, :then

  def initialize(text)
    @text = text.sub(text.match(self.class::REGEX)[0],'').strip
    @then = nil
  end

  def set_then(line)
    class_match = nestable_regex_class_match(line)
    @then = class_match&.new(line)
  end
end