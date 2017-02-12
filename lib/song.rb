class Song
  attr_accessor :name
  attr_reader :artist

  def initialize(name)
    @name = name
  end

  def artist=(name)
    @artist = Artist.new(name).name
  end

  def self.new_by_filename(filename)
    artist_name = filename.split(" - ")[0]
    name = filename.split(" - ")[1].split(".")[0]
    new_song = Song.new(name)
    new_song.artist = Artist.new(artist_name)
    return new_song
  end
end
