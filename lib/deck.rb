require_relative "value_lookup"

class Deck
  include ValueLookup
  attr_reader :cards

  def initialize
    @cards = ["2", "2", "2", "2",
              "3", "3", "3", "3",
              "4", "4", "4", "4",
              "5", "5", "5", "5",
              "6", "6", "6", "6",
              "7", "7", "7", "7",
              "8", "8", "8", "8",
              "9", "9", "9", "9",
              "10", "10", "10", "10",
              "J", "J", "J", "J",
              "Q", "Q", "Q", "Q",
              "K", "K", "K", "K",
              "A", "A", "A", "A"]
  end

  def card_numerical_value(card)
    VALUE_LOOKUP[card.upcase]
  end
end
