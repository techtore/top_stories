
require 'pry'
require 'open-uri'

class CLI
  def run 
    print_article
    menu
    goodbye
  end
  
  def print_article
    
    Scraper.scrape_articles
      puts "Today's Top Stories:"
      puts " "
      Article.all.each.with_index(1) do |article, index|
      puts "#{index}. #{article.title}"
      puts " "
      puts "Type the number of the article you would like more information about. Type print to see the list again, or exit to exit."
    end
  end
  
  def menu
    input = nil
    while input != "exit" do
      input = gets.strip.downcase
   
   if input == "print"
      print_article
   elsif
    article = Article.all[input.to_i-1]
    Scraper.scrape_article_info(article)
    else
      "Unsure of what you want, type print or exit."
    end
    end     
  end
  
  def goodbye 
    puts "Thank you for browsing. Goodbye!"
  end
end