require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")
require_relative("../guest")
require_relative("../song")
require_relative("../bar")

class RoomTest < MiniTest::Test
  def setup

    @song1 = Song.new("Alcest", "Sapphire", "metal")
    @song2 = Song.new("Nero", "Innocence", "electronic")
    @song3 = Song.new("Alcest", "Protection", "metal")

    @guest1 = Guest.new("Balazs", 20, "Sapphire")
    @guest2 = Guest.new("Bob", 50, "Innocence")
    @guest3 = Guest.new("John", 10, "Innocence")
    @guest4 = Guest.new("Kate", 15, "Innocence")
    @guest5 = Guest.new("Mark", 100, "Innocence")

    @room1 = Room.new(4, [@guest1], [@song1])
    @room2 = Room.new(5, [@guest1, @guest2], [@song1, @song2, @song3])

    @bar = Bar.new(10, [@room1, @room2], 1000)

  end

  def test_get_guests()
    assert_equal([@guest1], @room1.get_guests())
  end

  def test_get_playlist()
    assert_equal([@song1], @room1.get_playlist())
  end

  def test_get_room_space
    assert_equal(4, @room1.room_space)
  end

  def test_check_guest_in()
    @room1.check_guest_in(@guest2, @bar)
    assert_equal(2, @room1.get_guests().length)
    assert_equal(40, @guest2.get_money)
    assert_equal(1010, @bar.get_till)
  end

  def test_full_room()
    @room1.check_guest_in(@guest2, @bar)
    @room1.check_guest_in(@guest3, @bar)
    @room1.check_guest_in(@guest4, @bar)
    assert_equal("Sorry, no more space in this room!", @room1.check_guest_in(@guest5, @bar))
  end

  def test_check_guest_out()
    @room1.check_guest_out(@guest1)
    assert_equal(0, @room1.get_guests().length)
  end

  def test_add_song()
    @room1.add_song(@song2)
    assert_equal(2, @room1.get_playlist().length)
  end

  def test_delete_song()
    @room1.delete_song(@song1)
    assert_equal(0, @room1.get_playlist().length)
  end

  def test_favourite_song__true()
    assert_equal("Whoo!", @guest1.fav_song_in_playlist(@room1))
  end

  def test_favourite_song__false()
    assert_equal("Oh!", @guest2.fav_song_in_playlist(@room1))
  end

  def test_search_song_by_artist()
    assert_equal([@song1, @song3], @room2.search_song_by_artist("Alcest"))
  end

  def test_search_song_by_title()
    assert_equal([@song1], @room2.search_song_by_title("Sapphire"))
  end

  def test_search_song_by_genre()
    assert_equal([@song1, @song3], @room2.search_song_by_genre("metal"))
  end
end
