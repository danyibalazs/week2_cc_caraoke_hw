require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../bar")
require_relative("../room")
require_relative("../guest")
require_relative("../song")

class BarTest < MiniTest::Test

  def setup
    @song1 = Song.new("Alcest", "Sapphire", "metal")
    @song2 = Song.new("Nero", "Innocence", "electronic")

    @guest1 = Guest.new("Balazs", 20)
    @guest2 = Guest.new("Bob", 50)
    @guest3 = Guest.new("John", 10)
    @guest4 = Guest.new("Kate", 5)
    @guest5 = Guest.new("Mark", 100)

    @room1 = Room.new(4, [@guest1], [@song1])
    @room2 = Room.new(6, [], [])

    @bar = Bar.new(10, [@room1, @room2], 1000)
  end

  def test_get_till()
    assert_equal(1000, @bar.get_till())
  end

  def test_take_fee()
    @bar.take_fee()
    assert_equal(1010, @bar.get_till())
  end

  def test_pay_fee()
    @guest1.pay_fee(@bar)
    assert_equal(10, @guest1.get_money())
  end
end
