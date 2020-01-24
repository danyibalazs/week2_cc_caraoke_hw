class Room
  attr_reader :room_space
  def initialize(room_space, guests, playlist)
    @room_space = room_space
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
    if @guests.length < @room_space
    @guests.push(guest)
    end
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
