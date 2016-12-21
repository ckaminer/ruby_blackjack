class Dealer
  attr_accessor :cards

  def initialize(hand)
    @cards = []
    @hand  = hand
  end
end
