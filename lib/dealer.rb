require_relative "value_lookup"

class Dealer
  include ValueLookup
  attr_accessor :cards, :hand, :total

  def initialize(hand)
    @cards = []
    @total = 0
    @hand  = hand
  end

  def play
    calculate_total
    until @total > 16 do
      new_card = hand.deck.cards.pop
      cards << new_card
      @total += card_value(new_card)
    end
    puts "The dealer has #{@total}."
  end

  def calculate_total
    @total = 0
    cards.each do |card|
      @total += card_value(card)
    end
  end
end
