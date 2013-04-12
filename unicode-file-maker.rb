#!/usr/bin/env ruby
# Creates a file with user supplied unicode in the filename, and file extension

if ARGV[0] && ARGV[1]
  
  filetype  = ARGV[1]
  u         = ARGV[0].gsub(/\\u([\da-fA-F]{4})/) {|m| [$1].pack("H*").unpack("n*").pack("U*")}
  path      = u + "." + filetype
  File.new(path, "w")
  
else
  puts <<-INFO

Usage:
  ruby unicode-file-maker.rb <'filename text and unicode'> <file extension>

Examples:
  ruby unicode-file-maker.rb 'smiley\\u263a' png
  ruby unicode-file-maker.rb 'control char \\u001f' txt
  ruby unicode-file-maker.rb 'right-to-left \\u202e gepj' php

Description:
  This program will take an escaped unicode string, and insert it into the filename, to create
  a file that can be used in testing file upload filtering (make sure applications strip unicode).

  Supply arguments (in this order): unicode number (ex. '\\u202e') along with any other text you'd like
  to use in the filename, and the file extension (txt, php, avi, etc.). Make sure you add
  single-quotes around the escaped unicode (i.e., '\\u263a')

  This generator will not create valid filetypes for the extension you supply--it will only create
  an empty file with with whatever extension you choose. The unicode character will be inserted in the
  filename.

  INFO
end