class Article 
  attr_accessor :title, :url, :subtitle, :content 
   @@all = []
  
  def initialize 
    @@all << self
  end
  
  def self.all
    @@all 
  end
end 
  