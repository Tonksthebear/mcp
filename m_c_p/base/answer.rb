class MCP::Base::Answer < MCP::Base
  NESTABLE = true

  attr_accessor :text, :then

  def initialize(text)
    @text = strip_regex_match(text)
    @then = []
  end

  def parse_line(line)
    class_match = regex_class_match(line)
    @then << class_match&.new(line)
  end
end
