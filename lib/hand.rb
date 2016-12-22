require_relative 'dealer'
require_relative 'player'
require_relative 'deck'

class Hand
  attr_accessor :deck, :dealer, :player

  def initialize
    @deck   = Deck.new
    @dealer = Dealer.new(self)
    @player = Player.new(self)
    initial_deal
  end

  def initial_deal
    deck.cards.shuffle!
    player.cards << deck.cards.pop
    dealer.cards << deck.cards.pop
    player.cards << deck.cards.pop
    dealer.cards << deck.cards.pop
    puts "The dealer is showing #{dealer.cards.first}\nYou were dealt #{player.cards.join(", ")}\nWoud you like to (H) Hit or (S) Stay?"
    player_option
  end

  def player_option
    response = gets.chomp
    if response.downcase == "h"
      player.hit
    elsif response.downcase == "s"
      puts "Your total is #{player.calculate_total}.  Let's see what the dealer has."
      dealer.play
    else
      puts "Please select either (H) hit or (S) Stay."
    end
  end
end

Hand.new
