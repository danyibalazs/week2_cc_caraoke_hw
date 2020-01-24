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
end
