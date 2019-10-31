class Article 
  attr_accessor :title, :url, :subtitle 
   @@all = []
  
  def initialize 
    @@all << self
  end
  
  def self.all
    @@all 
  end
end 
  