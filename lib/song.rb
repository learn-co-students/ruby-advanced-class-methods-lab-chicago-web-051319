require 'pry'
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
    @song = self.new.save[-1]
  end
  
  def self.new_by_name(name)
    @song = self.create
    @song.name = name
    @song
  end
  
  def self.create_by_name(name)
    @song = self.new_by_name(name)
    @song
  end
  
  
  def self.find_by_name(search)
      @@all.each do |song| 
        if song.name == search 
        return song
        end
      end
      nil
    end
  
   def self.find_or_create_by_name(song)
     self.find_by_name(song) == nil ? self.create_by_name(song) : self.find_by_name(song)
    end
  
  def self.alphabetical
        @@all.sort do |a, b| a.name <=> b.name
        end
    end
  
  def self.new_from_filename(file_name)
        arr = file_name.split(" - ")
        song = arr[1].split(".")[0]
        @song = Song.create_by_name(song)
        @song.artist_name = arr[0]
        @song
    end
  
  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end
    
  def self.destroy_all
    @@all = []
  end
end
