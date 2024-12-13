class Song
  attr_accessor :name, :artist_name, :create, :new_by_name, :create_by_name, :artist
  attr_reader :all
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.create
    @name = song_name
    new_song.name = @name
    new_song
  end

  def self.create_by_name(name)
    new_by_name(name)
  end

  def self.find_by_name(song_name)
    @@all.find {|song| song.name === song_name}
  end

  def self.find_or_create_by_name(song_name)
    found = self.find_by_name(song_name)
    if found.nil?
      self.create_by_name(song_name)
    else
      found
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    new_song = self.new

    remove_file_type = filename.slice(0..-5)
    title_artist = remove_file_type.split(' - ')
    new_song.name = title_artist[1]
    new_song.artist_name = title_artist[0]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    @@all << new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
