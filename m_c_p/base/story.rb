class MCP::Base::Story
  def initialize(file_path)
    self.class.parse(File.read(file_path))
  end

  def self.parse(file_data)
    raise "Implement in inherited class"
  end
end
