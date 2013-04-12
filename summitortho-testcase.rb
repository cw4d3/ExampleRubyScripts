#!/usr/bin/env ruby

# Request a page X amount of times and look for an element on the page

require 'nokogiri'
require 'open-uri'

i = 0
while i < 100 
  doc = Nokogiri::HTML(open('http://summitortho-new.nerderylabs.com'))
  doc.search('div#mainsub.dr span.bigsub h1 a').each do |tag|
    
    # Make sure Dr. Gannon is not present in rotation
    if tag.content == 'James Gannon, M.D.' 
      puts "#######  FAIL!!  #######" + tag.content
    else
      # Print the name of each doctor each time the page loads,
      # just for verbosity's sake
      puts tag.content 
    end
    
    ## Check to see if Dr. T has 'Medical Specialties' listed
    #if tag.content == 'Dr. New Guy'
    #  doc.search('div#mainsub.dr span.bigsub').each do |r|
    #  puts r.content
    #  end
    #end
  i += 1
  end
end