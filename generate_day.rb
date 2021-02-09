#!/usr/bin/ruby

WRONG_ARGUMENTS_MESSAGE = "Please input the day number to generate, or 'next'"
DAY_EXISTS_MESSAGE = "Error! A folder for that day already exists."


if ARGV && ARGV.length != 1
  abort WRONG_ARGUMENTS_MESSAGE
end
