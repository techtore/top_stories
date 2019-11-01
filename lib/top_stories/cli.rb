class CLI
  
  def run 
      puts "Today's Top Stories:"
      puts " "
      Scraper.scrape_articles
      print_article
      puts " "
      puts "Type the number of the article you would like to read"
      input = gets.strip.downcase
      while input != 'exit'  do
        if input.to_i > 0 && input.to_i <= 6
          article = Article.all[input.to_i-1] 
          Scraper.scrape_article_content(article) if !article.subtitle
          print_article_content(article)
        elsif input == 'list'
          print_article
        elsif input.to_i <= 0 || input.to_i > 6
          puts "Invalid input. Type list to see artcile titles again, or 'exit' to exit."
        end
          puts " "
          puts "_____________________________________Menu______________________________________"
          puts "Would you like to read another article?"
          puts "If so, you can:"
          puts "1.Type the number of the article you would like to read."
          puts "2.Type 'list' to see the list again."
          puts "3.Type 'exit' to exit."
          puts " "
          input = gets.strip.downcase
        end
        puts "Thank you for reading. See you again tomorrow!"
    end
  
  def print_article
      Article.all.each.with_index(1) do |article, index|
        puts "#{index}. #{article.title}"
        sleep(0.75)
        puts " "
    end
  end
  
  def print_article_content(article)
      puts "Title: #{article.title}"
      sleep(1)
      puts " "
      puts "#{article.subtitle}"
      sleep(3)
      puts " "
      puts "#{article.content}"
  end
end