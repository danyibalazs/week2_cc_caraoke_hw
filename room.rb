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

  def check_guest_in(guest)
    @guests.push(guest)
  end

  def check_guest_out(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @playlist.push(song)
  end

  def delete_song(song)
    @playlist.delete(song)
  end
end
