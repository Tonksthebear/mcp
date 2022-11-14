require('./m_c_p/imports.rb')

path = unless ARGV.empty?
         ARGV[0]
       else
         puts "Please enter the relative file path to the ChoiceScript file"
         gets.chomp
       end

story = MCP::ChoiceScript::Story.new(File.join(__dir__, path))

