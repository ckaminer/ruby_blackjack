require_relative 'dealer'
require_relative 'player'
require_relative 'deck'

class Hand
  attr_accessor :deck, :dealer, :player

  def initialize
    @deck   = Deck.new
    @dealer = Dealer.new
    @player = Player.new
    initial_deal
  end

  def initial_deal
    deck.cards.shuffle!
    player.cards << deck.cards.pop
    dealer.cards << deck.cards.pop
    player.cards << deck.cards.pop
    dealer.cards << deck.cards.pop
    puts "The dealer is showing #{dealer.cards.first}\nYou were dealt #{player.cards.join(", ")}\nWoud you like to (H) Hit or (S) Stay?"
  end
end
