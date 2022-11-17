class MCP::Base::Conditional < MCP::Base
  NESTABLE = true

  attr_accessor :if, :then, :body

  def initialize(condition)
    @if = strip_regex_match(condition)
    @then = []
    @body = ""
  end

  def parse_line(line)
    class_match = nestable_regex_class_match(line)
    class_match ? @then << class_match.new(line) : @body << line
  end
end
