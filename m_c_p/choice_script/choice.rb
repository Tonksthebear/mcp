class MCP::ChoiceScript::Choice < MCP::Base::Choice 
  REGEX = /^\*choice/

  def initialize(choice_text)
    @indentation_count = indentation_count(choice_text)
    super
  end
end
