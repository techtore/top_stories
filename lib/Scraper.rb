require 'open-uri'
require 'pry'
class Scraper
  
  def self.scrape_articles
    html = open("https://www.huffpost.com")
    doc = Nokogiri::HTML(html)
      doc.css("div.zone__content")[1].css("div.card__content").each do |art|
   
        article = Article.new
        article.title = art.css("div.card__details").css("div.card__headline__text").text.strip
        article.url = art.css("a").attribute("href").value
        
    end
  end
  
  def self.scrape_article_content(article)
    
    html = open(article.url)
    doc = Nokogiri::HTML(html)
     
    doc.css("js-entry-text.yr-entry-text").each do |art|
      article.subtitle = art.css("div.headline__subtitle").text
      article.content = art.css("div.content-list-component.yr-content-list-text")[0].css("p")[0].text
     
    end
  end
end
