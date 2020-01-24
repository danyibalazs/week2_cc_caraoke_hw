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

    @guest1 = Guest.new("Balazs")
    @guest2 = Guest.new("Bob")

    @room1 = Room.new([@guest1], [@song1])
  end

  def test_get_guests()
    assert_equal([@guest1], @room1.get_guests())
  end

  def test_get_playlist()
    assert_equal([@song1], @room1.get_playlist())
  end

  def test_check_guest_in()
    @room1.check_guest_in(@guest2)
    assert_equal(2, @room1.get_guests().length)
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
