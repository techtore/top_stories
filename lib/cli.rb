require 'nokogiri'
require 'open-uri'
require 'pry'

def run 
  puts "Today's Top Stories:"
  puts " "
  
  doc = Nokogiri::HTML(open("https://www.huffpost.com"))
  doc.css("div.zone__content")[1].css("card card--left card--media-left card--standard js-card yr-card").each do |art|
    article = Articles.new
    article.title = art.css("div.card__details").css("div.card__headlines").css("card__headline").css("div.card__headline__text").text
  end
end 