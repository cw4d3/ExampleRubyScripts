#!/usr/bin/env ruby

# This program will read in a list of urls (http://domain.com format) and return
# the response code for each request.

require 'net/http'
require 'uri'

File.readlines("/path/to/file.txt").each do |line|

    uri = URI("#{line}")
    res = Net::HTTP.get_response(uri)
    puts res.code + " " + res.message

end