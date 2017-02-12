class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    filepaths = Dir.glob("#{@path}/*.mp3")

    filepaths.collect do |file|
      file.split("/")[-1]
    end
  end

  def import
    files.each do |file|
      artist_name = file.split(" - ")[0]
      song_name = file.split(" - ")[1]
      song = Song.new(song_name)
      artist = Artist.find_or_create_by_name(artist_name)
      artist.add_song(song)
    end
  end
end
