class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = Array.new

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    if self.all.collect {|artist| artist.name}.include?(name)
      self.all.find {|artist| artist.name == name}
    else
      artist = self.new(name)
      artist.save
      return artist
    end
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
end
