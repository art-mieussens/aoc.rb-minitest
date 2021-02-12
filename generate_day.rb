#!/usr/bin/ruby
# frozen_string_literal: true

# Simple directory and files generator for a new day.

require 'erb'

WRONG_ARGUMENTS_MESSAGE = 'Wrong argument, please provide the day number to generate'
DAY_EXISTS_MESSAGE = 'Error! A folder for that day already exists.'

abort WRONG_ARGUMENTS_MESSAGE if ARGV && ARGV.length != 1

if ARGV[0].match(/^\d+$/)
  day_number = ARGV[0]
else
  abort WRONG_ARGUMENTS_MESSAGE
end

day_name = "day#{day_number}"

abort DAY_EXISTS_MESSAGE if Dir.exist? day_name

puts "./#{day_name}" if Dir.mkdir day_name
Dir.chdir day_name

day_template = ERB.new <<-EOF
  class Puzzle
    def initialize(input_file_name)
      # Initialization code
      # @input = File.open(input_file_name).read
    end

    attr_accessor :input
  end

  # puzzle = Puzzle.new('<%= day_name %>/input.txt')
  # puzzle.process
  # puts "output"
EOF

day_file = "#{day_name}.rb"
puts "./#{day_name}/#{day_file}" if File.write day_file, day_template.result

test_day_template = ERB.new <<-EOF
  require 'minitest/autorun'
  require_relative <%= day_name %>

  class TestDay<%= day_number %> < Minitest::Test
    def setup
      @puzzle = Puzzle.new('<%= day_name %>/input.txt')
    end

    # def test_reads_input_file_and_initializes
    #   assert !@puzzle.input.nil?, 'input file not read'
    # end

    # def test_input_should_be_a_single_string
    #   assert @puzzle.input.instance_of?(String),
    #          'input file should be a single string'
    # end

  end
EOF

test_day_file = "test_#{day_name}.rb"
if File.write test_day_file, test_day_template.result
  puts "./#{day_name}/#{test_day_file}"
end
