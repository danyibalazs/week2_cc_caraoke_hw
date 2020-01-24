class Room
  def initialize(guests, playlist)
    @guests = guests
    @playlist = playlist
  end

  def get_guests()
    return @guests
  end

  def get_playlist()
    return @playlist
  end
end
