class MCP::Base
  Dir["#{File.dirname(__FILE__)}/base/**/*.rb"].each { |f| load(f) }

  def module_name
    self.class.name.split("::")[0..1].join("::")
  end

  def strip_regex_match(line)
    line.sub(line.match(self.class::REGEX)[0],'').strip
  end

  def class_name_to_variable(class_name)
    class_name.split("::").last.downcase.pluralize
  end

  def append_to_instance_variable(class_object, value)
    variable_name = class_name_to_variable(class_object.name)

    current_value = instance_variable_get("@#{variable_name}") || []
    instance_variable_set("@#{variable_name}", current_value << value)
  end
end
