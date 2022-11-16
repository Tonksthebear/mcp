class MCP::Base::Choice < MCP::Base
  attr_accessor :options

  def initialize(choice_text)
    @options = []
    parse_text(choice_text)
  end

  def parse_line(line)
    @options << option_class.new(line)
  end

  private

  def parse_text(choice_text)
  end

  def option_class
    (module_name + "::Option").constantize
  end
end
