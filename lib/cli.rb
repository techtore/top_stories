
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
    while input != "exit" do
      if input > 0
        article = Article.all[input.to_i-1]
        Scraper.scrape_article_info(article) if !article.subtitle
  
        print_article_content(article)
        puts "Would you like to read another article?"
        puts "If so, type the number of the article you would like to read"
        input = gets.strip.downcase
      end 
    goodbye
  end
  
  def print_article 
      Article.all.each.with_index(1) do |article, index|
      puts "#{index}. #{article.title}"
      puts " "
      puts "Type the number of the article you would like more information about. Type print to see the list again, or exit to exit."
    end
  end
  
  def print_article_content(article)
    puts "#{article.subtitle}"
    puts "#{article.content}"
    
  end
  
  def goodbye 
    puts "Thank you for browsing. Goodbye!"
  end
end