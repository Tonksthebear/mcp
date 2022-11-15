require 'active_support'
require 'active_support/core_ext'
require 'active_model'
load 'm_c_p/m_c_p.rb'

path = unless ARGV.empty?
         ARGV[0]
       else
         puts "Please enter the relative file path to the ChoiceScript file"
         gets.chomp
       end

story = MCP::ChoiceScript::Story.new(path)
binding.irb

