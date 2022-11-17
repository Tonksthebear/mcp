class MCP::ChoiceScript::Conditional < MCP::Base::Conditional
  #Having trouble getting regex to not capture the if condition itself with a non-capturing group
  REGEX = /^\*if\s\(/
end
