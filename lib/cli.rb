
require 'pry'

class CLI
  def run 
    puts "Today's Top Stories:"
    puts " "
    Scraper.scrape_articles
    print_article
    puts " "
    puts "Type the number of the article you would like more information about. Type print to see the list again, or exit to exit."
    menu
  end
  
  def print_article
    Article.all.each.with_index(1) do |article, index|
      puts "#{index}. #{article.title}"
    end
  end
  
  def menu
    input = nil
    input = gets.strip.downcase
    while input != "exit" do
      article = Article.all[input.to_i-1]
      Scraper.scrape_article_info(article)
      binding.pry
    end
   
   if input == "print"
        print_article
    else
      "Unsure of what you want, type print or exit."
    end     
  end
  
  def goodbye 
    puts "Thank you for browsing. Goodbye!"
  end
end