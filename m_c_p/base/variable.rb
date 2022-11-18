class MCP::Base::Variable
  NESTABLE = false

  attr_accessor :name, :value

  def initialize(line)
    values = line.text.split(" ")
    @name = values[1]
    @value = values[2]
  end
end
