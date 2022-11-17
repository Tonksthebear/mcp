class MCP::Base
  Dir["#{File.dirname(__FILE__)}/base/**/*.rb"].each { |f| load(f) }

  def module_name
    self.class.name.split("::")[0..1].join("::")
  end

  def nestable_regex_class_match(line)
    classes = Dir["#{File.dirname(__FILE__)}/base/**/*.rb"].map do |f|
      (module_name + '::' +f.split('/').last[0...-3].titleize).constantize
    end

    classes.each do |current_class|
      next unless current_class::NESTABLE

      return current_class if line.match(current_class::REGEX)
    end

    nil
  end

  def indentation_count(line)
    line.scan(/\ {4}|\t/).length
  end
end
