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

  def check_guest_in(guest, bar)
    if @guests.length < @room_space && guest.get_money >= bar.fee
      @guests.push(guest)
      guest.pay_fee(bar)
      bar.take_fee()
    else
      return "Sorry, no more space in this room!"
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

  def search_song_by_artist(artist)
    song_list = @playlist.find_all { |song| song.artist == artist}
    return song_list
  end

  def search_song_by_title(title)
    song_list = @playlist.find_all { |song| song.title == title}
    return song_list
  end

  def search_song_by_genre(genre)
    song_list = @playlist.find_all { |song| song.genre == genre}
    return song_list
  end
end
