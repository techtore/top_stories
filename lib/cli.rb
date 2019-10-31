
require 'pry'

class CLI
  def run 
    puts "Today's Top Stories:"
    puts " "
    print_title
    menu
  end
  
  def print_article
    Article.all.each.with_index(1) do |title, index|
      puts "#{index}. #{title}"
    end
  end
  
  def menu
    
  end

end