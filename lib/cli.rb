
require 'pry'
require 'open-uri'

class CLI
  
  def run 
    puts "Today's Top Stories:"
    puts " "
    print_article
    
    input = gets.strip.downcase
    while input != "exit" do
      article = Article.all[input.to_i-1]
      Scraper.scrape_article_info(article)

    if input == "print"
      print_article
     
    else
      "Unsure of what you want, type print or exit."
    end 
    end
    goodbye
  end
  
  def print_article #doesn't work without Scraper.scrape_articles
     Scraper.scrape_articles
      Article.all.each.with_index(1) do |article, index|
      puts "#{index}. #{article.title}"
      puts " "
      puts "Type the number of the article you would like more information about. Type print to see the list again, or exit to exit."
    end
  end
  
  # def menu #doesn't work
        
  # end
  
  def goodbye 
    puts "Thank you for browsing. Goodbye!"
  end
end