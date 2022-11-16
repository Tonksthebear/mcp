class MCP::ChoiceScript::Choice < MCP::Base::Choice 
  SETTER_REGEX = /\*choice/

  def initialize(choice_text)
    @indentation_count = indentation_count(choice_text)
    super
  end
end
