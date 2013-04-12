#!/usr/bin/env ruby

# This program will generate a string that is the length specified as a command line argument.


if ARGV[0] =~ /^[0-9].*/

  int = ARGV[0].to_i
  a = String.new
  
  while a.length < int
    a.concat "a"
  end
  
  puts "Your #{a.length} char long string, prepared specially just for you:\n"
  puts a
  
  else
    puts <<-INFO

Description:
  Supply an integer as an argument. A string will be generated that is the length that you specified.

Usage:
  ruby string-generator.rb <INT>

    INFO
end
