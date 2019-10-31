require 'nokogiri'
require 'open-uri'
require 'pry'

def run 
  puts "Today's Top Stories:"
  puts " "
  
  doc = Nokogiri::HTML(open("https://www.huffpost.com"))
  doc.css("div.zone__content")[1].css("div.card__content").each do |art|
      articles = []
    # article = Articles.new
    title = art.css("div.card__details").css("div.card__headline__text").text.strip
      articles << title
  end
    articles.each.with_index(1) do |title, index|
      puts "#{index}. #{title}"
  end
end 