
require 'pry'
require 'open-uri'

class CLI
  
  def run 
    puts "Today's Top Stories:"
    puts " "
    Scraper.scrape_articles
    print_article
    puts " "
    puts "Type the number of the article you would like to read"
   
    input = gets.strip.downcase
    while input != "exit" && input.to_i > 0 && input.to_i <= 6 do
      
        article = Article.all[input.to_i-1] 
        Scraper.scrape_article_content if !article.subtitle
        
        print_article_content(article)
        
        puts " "
        puts "Would you like to read another article?"
        puts "If so, type the number of the article you would like to read, or type 'exit' to exit"
        input = gets.strip.downcase
      
    end 
    goodbye
  end
  
  def print_article
      Article.all.each.with_index(1) do |article, index|
      puts "#{index}. #{article.title}"
      puts " "
    end
  end
  
  def print_article_content(article)
    Scraper.scrape_article_content(article)
    puts "#{article.subtitle}"
    puts "#{article.content}"
    
  end
  
  def goodbye 
    puts "Thank you for browsing. Goodbye!"
  end
end