#!/usr/bin/ruby env

#compare the contents of two files' contents

orig_file = []
new_file = []

File.foreach('/path/to/file.txt') do |line|
  orig_file.push(line)
end

File.foreach('/path/to/file-2.txt') do |line|
  new_file.push(line)
end

difference = orig_file - new_file
puts orig_file.count
puts new_file.count
puts difference#.count

