
require 'pry'

class CLI
  def run 
    puts "Today's Top Stories:"
    puts " "
    Scraper.scrape_articles
    binding.pry
    print_article
    menu
  end
  
  def print_article
    Article.all.each.with_index(1) do |article, index|
      puts "#{index}. #{article.title}"
    end
  end
  
  def menu
    
  end

end