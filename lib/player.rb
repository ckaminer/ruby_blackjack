require_relative "value_lookup"

class Player
  include ValueLookup
  attr_accessor :cards, :hand, :total

  def initialize(hand)
    @cards = []
    @hand  = hand
    @total = 0
  end

  def hit
    cards << hand.deck.cards.pop
    calculate_total
    if total > 21
      puts "You were dealt a #{cards.last} for a total of #{@total}.  You busted and lost the hand."
    else
      puts "You were dealt a #{cards.last} for a total of #{@total}\nWoud you like to (H) Hit or (S) Stay?"
      hand.player_option
    end
  end

  def calculate_total
    @total = 0
    cards.each do |card|
      @total += VALUE_LOOKUP[card.upcase]
    end
    @total
  end
end
