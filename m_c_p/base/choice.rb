class MCP::Base::Choice < MCP::Base
  NESTABLE = true

  attr_accessor :options

  def initialize(choice_text)
    @options = []
  end

  def parse_line(line)
    class_match = regex_class_match(line)

    @options << class_match.new(line) if class_match
  end
end
