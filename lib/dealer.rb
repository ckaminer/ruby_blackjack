require_relative "value_lookup"

class Dealer
  include ValueLookup
  attr_accessor :cards, :hand

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
      @total += VALUE_LOOKUP[new_card.upcase]
    end
    puts "The dealer has #{@total}."
  end

  def calculate_total
    @total = 0
    cards.each do |card|
      @total += VALUE_LOOKUP[card.upcase]
    end
  end
end
