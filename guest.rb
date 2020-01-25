class Guest
  attr_reader :name, :fav_song
  def initialize(name, money, fav_song)
    @name = name
    @money = money
    @fav_song = fav_song
  end

  def get_money()
    return @money
  end

  def pay_fee(bar)
    @money -= bar.fee()
  end

  def fav_song_in_playlist(room)
    song_list = room.get_playlist.map { |song| song.title}
    if song_list.include?(@fav_song)
      return "Whoo!"
    else
      return "Oh!"
    end
  end
end
