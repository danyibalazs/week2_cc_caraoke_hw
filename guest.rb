class Guest
  attr_reader :name
  def initialize(name, money)
    @name = name
    @money = money
  end

  def get_money()
    return @money
  end

  def pay_fee(bar)
    if @money >= bar.fee()
      @money -= bar.fee()
    end
  end
end
