require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guest")

class GuestTest < MiniTest::Test

  def setup
    @guest = Guest.new("Balazs", 10, "Innocence")
  end

  def test_has_name()
    assert_equal("Balazs", @guest.name())
  end

  def test_get_money()
    assert_equal(10, @guest.get_money())
  end

  def test_get_fav_song()
    assert_equal("Innocence", @guest.fav_song())
  end
end
