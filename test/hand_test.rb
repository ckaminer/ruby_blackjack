require_relative '../lib/hand'
require 'minitest/autorun'
require 'minitest/pride'

class HandTest < Minitest::Test
  def test_hands_are_initialize_with_dealer_player_deck
    h = Hand.new
    assert_equal Dealer, h.dealer.class
    assert_equal Player, h.player.class
    assert_equal Deck, h.deck.class
  end

  def test_two_cards_are_dealt_to_player_upon_new_hand
    h = Hand.new
    assert_equal 2, h.player.cards.length
  end

  def test_two_cards_are_dealt_to_dealer_upon_new_hand
    h = Hand.new
    assert_equal 2, h.dealer.cards.length
  end

  def test_four_cards_are_removed_from_deck_upon_new_hand
    h = Hand.new
    assert_equal 48, h.deck.cards.length
  end
end
