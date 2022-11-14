module MCP::Twine
  Dir["#{File.dirname(__FILE__)}/twine/**/*.rb"].each { |f| load(f) }
end
