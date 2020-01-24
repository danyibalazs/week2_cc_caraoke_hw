class Song
  attr_reader :artist, :title, :genre
  def initialize(artist, title, genre)
    @artist = artist
    @title = title
    @genre = genre
  end
end
