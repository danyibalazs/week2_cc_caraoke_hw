class Guest
  attr_reader :name
  def initialize(name, money)
    @name = name
    @money = money
  end

  def get_money()
    return @money
  end
end
