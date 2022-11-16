class MCP::Base::Variable
  attr_accessor :name, :value

  def initialize(variable_text)
    values = variable_text.split(" ")
    @name = values[1]
    @value = values[2]
  end
end
