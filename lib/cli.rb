require 'nokogiri'
require 'open-uri'
require 'pry'

def run 
  puts "Today's Top Stories:"
  puts " "
  
  doc = Nokogiri::HTML(open(https://www.huffpost.com/))
  
end 