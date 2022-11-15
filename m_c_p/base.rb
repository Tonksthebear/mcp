class MCP::Base
  Dir["#{File.dirname(__FILE__)}/base/**/*.rb"].each { |f| load(f) }

  def module_name
    self.class.name.split("::")[0..1].join("::")
  end
end
