require_relative '../lib/deck'
require 'minitest/autorun'
require 'minitest/pride'

class DeckTest < Minitest::Test
  def test_deck_exists
    d = Deck.new
    assert_equal Deck, d.class
  end

  def test_deck_created_with_52_card_deck
    d = Deck.new
    assert_equal 52, d.cards.length
  end

  def test_each_card_is_unique
    d = Deck.new
    assert_equal 52, d.cards.uniq.length
  end

  def test_numerical_value_lookup
    d = Deck.new
    assert_equal 2,  d.card_numerical_value("2♦")
    assert_equal 10, d.card_numerical_value("K♦")
    assert_equal 11, d.card_numerical_value("a♦")
  end
end
