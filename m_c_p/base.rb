module MCP::Base
  Dir["#{File.dirname(__FILE__)}/base/**/*.rb"].each { |f| load(f) }
end
