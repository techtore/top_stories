class Scraper
  
  def self.scrape_articles
    doc = Nokogiri::HTML(open("https://www.huffpost.com"))
      doc.css("div.zone__content")[1].css("div.card__content").each do |art|
    
        article = Article.new
        article.title = art.css("div.card__details").css("div.card__headline__text").text.strip
        article.url = art.css("a").attribute("href").value
    end
  end
  
  def self.scrape_article_info(article)
     doc = Nokogiri::HTML(open("https://www.huffpost.com#{article.url}"))
  end
end
