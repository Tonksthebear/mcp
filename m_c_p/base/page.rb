class MCP::Base::Page < MCP::Base
  attr_accessor :story, :title, :body, :variables, :choices

  def initialize(story, page_text)
    @variables = []
    @choices = []

    @story = story
    @body = page_text
    parse_body

    binding.irb
  end


  private

  def parse_body
    set_title
  end

  def set_title
    @title = @body[/(?<=#{self.class::START_REGEX}).*/]
    @body.slice!(/#{self.class::START_REGEX}.*\n/)
  end

  def set_variables
    file_data.enum_for(:scan, page_class::START_REGEX).map do 
      Regexp.last_match.begin(0)
    end
  end

  def variable_indexes
    file_data.enum_for(:scan, variable_class::START_REGEX).map do 
      Regexp.last_match.begin(0)
    end
  end

  def variable_class
    (module_name + "::Variable").constantize
  end
end
