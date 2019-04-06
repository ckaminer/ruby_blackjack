require_relative 'dealer'
require_relative 'player'
require_relative 'deck'
require_relative 'value_lookup'

class Hand
  include ValueLookup
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
    puts "The dealer is showing #{dealer.cards.first}\n"
    puts "You were dealt #{player.cards.join(", ")}\n"
    puts "Woud you like to (H) Hit or (S) Stay? Not sure what to do? Ask for a tip (T)"
    player_option
  end

  def player_option
    response = gets.chomp
    if response.downcase == "h"
      player.hit
    elsif response.downcase == "s"
      puts "Your total is #{player.calculate_total}.  Let's see what the dealer has."
      dealer.play
      determine_result
    elsif response.downcase == "t"
      puts give_tip
      player_option
    else
      puts "Please select either (H) hit or (S) Stay."
    end
  end

  def give_tip
    dealer_showing = card_value(dealer.cards.first)
    if 1 < dealer_showing && dealer_showing < 7
      return "The dealer is showing a bust card. Why don't you sit this one out."
    else
      return "You should probably take a card."
    end
  end

  def determine_result
    if dealer.total > 21
      puts "The dealer busted. You won the hand!"
    elsif player.total > dealer.total
      puts "You had more than the dealer without busting and won the hand!"
    else
      puts "The dealer scored more than you.  You lost the hand."
    end
  end
end
