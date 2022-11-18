class MCP::Base::Line
  attr_reader :indentation, :text, :command_class, :command_class_instance, :index

  def initialize(line_text, module_class, index)
    @text = line_text
    @module_class = module_class
    @indentation = indentation_count
    @command_class = get_command_class
    @index = index
  end

  def get_command_class
    @module_class.constants.map do |sym|
      current_class = @module_class.const_get(sym)

      next unless current_class.const_defined?(:REGEX)
      return current_class if @text.match(current_class::REGEX)
    end

    nil
  end

  def body
    if @command_class
      @text.sub(@text.match(@command_class::REGEX)[0],'').strip
    else
      @text
    end
  end

  def nestable?
    @command_class&.const_get(:NESTABLE)
  end

  private

  def indentation_count
    @text.scan(/\ {4}|\t/).length
  end
end
