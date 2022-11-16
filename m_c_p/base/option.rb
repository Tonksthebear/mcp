class MCP::Base::Option < MCP::Base
  attr_accessor :text


  def initialize(choice_text)
    @text = choice_text
  end

  private

  def parse_text(choice_text)
  end
end
