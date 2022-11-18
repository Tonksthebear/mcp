class MCP::Base::Story < MCP::Base
  NESTABLE = false

  attr_accessor :pages

  def initialize(file_path)
    @pages = []
    parse_pages(File.read(file_path))
  end

  def parse_pages(file_data)
    page_header_indexes = page_indexes(file_data)

    page_header_indexes.each_with_index do |page_header_index, i|
      if i < page_header_indexes.length - 1
        pages << page_class.new(self, file_data[page_header_index...page_header_indexes[i + 1]])
      else
        pages << page_class.new(self, file_data[page_header_index..])
      end
    end
  end

  def page_indexes(file_data)
    file_data.enum_for(:scan, page_class::REGEX).map do 
      Regexp.last_match.begin(0)
    end
  end

  def page_class
    (module_name + "::Page").constantize
  end
end
