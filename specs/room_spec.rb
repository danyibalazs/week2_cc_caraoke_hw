require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room")
require_relative("../guest")
require_relative("../song")

class RoomTest < MiniTest::Test
  def setup

    @song1 = Song.new("Alcest", "Sapphire", "metal")
    @song2 = Song.new("Nero", "Innocence", "electronic")

    @guest1 = Guest.new("Balazs", 20)
    @guest2 = Guest.new("Bob", 50)
    @guest3 = Guest.new("John", 10)
    @guest4 = Guest.new("Kate", 5)
    @guest5 = Guest.new("Mark", 100)

    @room1 = Room.new(4, [@guest1], [@song1])
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
    @room1.check_guest_in(@guest2)
    assert_equal(2, @room1.get_guests().length)
  end

  def test_full_room()
    @room1.check_guest_in(@guest2)
    @room1.check_guest_in(@guest3)
    @room1.check_guest_in(@guest4)
    @room1.check_guest_in(@guest5)
    assert_equal(4, @room1.get_guests().length)
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
end
