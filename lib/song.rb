class Song
  attr_accessor :name, :artist_name
  @@all = []
 
  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end
  
  def self.create
    @song = Song.new
    @song.save
    return @song
  end
  
  def self.new_by_name(name)
    @song = self.create
    @song.name = name
    return @song
  end
  
  def self.create_by_name(name)
    self.new_by_name(name) # what the flippidy fuck did I do here that makes these two functions have the same output?
    #what should the difference be?
  end
  
  def self.find_by_name(name)
    @@all.find do |i|
      i.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    #p name
    if self.find_by_name(name) == nil
      return create_by_name(name)
    else
      return self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort {|i , j| i.name <=> j.name}
  end
  
  def self.new_from_filename(name)
    @song = self.create
    temp = name.split(" - ")
    temp[1] = temp[1].chomp(".mp3")
    @song.artist_name = temp[0]
    @song.name = temp[1]
    
    return @song
  end
  
  def self.create_from_filename(name)
    self.new_from_filename(name)
    # again?    seriously?  Dafuq
  end
  
  def self.destroy_all
    @@all = []
  end
  
 
end