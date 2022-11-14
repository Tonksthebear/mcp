module MCP::ChoiceScript
  Dir["#{File.dirname(__FILE__)}/choice_script/**/*.rb"].each { |f| load(f) }
end
