require 'open-uri'
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
  
  def self.scrape_article_info(article)
    html = open("https://www.huffpost.com/#{article.url}")
    doc = Nokogiri::HTML(html)
    # article.subtitle = doc.css("div.headline__subtitle").text
  end
end
