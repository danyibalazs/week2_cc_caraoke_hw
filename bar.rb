class Bar
  attr_reader :fee, :rooms
  def initialize(fee, rooms, till)
    @fee = fee
    @rooms = rooms
    @till = till
  end

  def get_till
    return @till
  end
end
