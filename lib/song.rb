require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = self.new
    song.save
    song
  end

  def Song.new_by_name(song_name)
      song = self.new
      song.name = song_name
      song
  end

  def Song.create_by_name(song_name)
      song = self.create
      song.name = song_name
      song
  end

  def Song.find_by_name(song_name)
      @@all.find{|the_song| the_song.name == song_name}
  end

  def Song.find_or_create_by_name(song_2)
     self.find_by_name(song_2) || self.create_by_name(song_2)
  end

  def Song.alphabetical
    @@all.sort_by {|a| a.name}
  end

  def Song.new_from_filename(file)
      file = file.split(/\ - |\./)
      song_name = file[1]
      artist_name = file[0]

      song= self.new
      song.name = song_name
      song.artist_name=artist_name
      song
  end

  def Song.create_from_filename(file)
      file = file.split(/\ - |\./)
      song_name = file[1]
      artist_name = file[0]

      song = self.create
      song.name = song_name
      song.artist_name = artist_name
      song
  end

  def Song.destroy_all
      @@all.clear
  end


end
