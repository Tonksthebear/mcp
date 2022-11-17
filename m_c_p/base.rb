class MCP::Base
  Dir["#{File.dirname(__FILE__)}/base/**/*.rb"].each { |f| load(f) }

  def module_name
    self.class.name.split("::")[0..1].join("::")
  end

  def strip_regex_match(line)
    line.sub(line.match(self.class::REGEX)[0],'').strip
  end

  def regex_class_match(line)
    module_class = module_name.constantize

    module_class.constants.map do |sym|
      current_class = module_class.const_get(sym)

      return current_class if line.match(current_class::REGEX)
    end

    nil
  end

  def indentation_count(line)
    line.scan(/\ {4}|\t/).length
  end
end
