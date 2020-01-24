require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../song")

class SongTest < MiniTest::Test
  def setup
    @song1 = Song.new("Alcest", "Sapphire", "metal")
    @song2 = Song.new("Nero", "Innocence", "electronic")
  end

  def test_has_artist()
    assert_equal("Alcest", @song1.artist())
  end

  def test_has_title()
    assert_equal("Sapphire", @song1.title())
  end

  def test_has_genre()
    assert_equal("electronic", @song2.genre())
  end
end
