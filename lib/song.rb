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
    @song=self.new
    @song.save
    # self.all<<@song
    @song
  end

  def self.new_by_name(name)
    @song=self.new
    @song.name=name
    @song
  end

  def self.create_by_name(name)
    @song=self.create
    @song.name=name
    @song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name==song_name
    end
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name==song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if !(self.find_by_name(song_name))
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    @song=self.new
    file_array=filename.split(" - ")
    @song.name=file_array[1].split(".")[0]
    @song.artist_name=file_array[0]
    @song
  end

  def self.create_from_filename(filename)
    @song=self.new_from_filename(filename)
    @song.save
    @song
  end

  def self.destroy_all
    @@all=[]
  end
end
