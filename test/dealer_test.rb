require './lib/dealer'
require 'minitest/autorun'
require 'minitest/pride'

class DealerTest < Minitest::Test
  def test_dealer_exists_with_cards
    d = Dealer.new
    assert_equal Dealer, d.class
    assert_equal Array, d.cards.class
    assert_equal 0, d.cards.length
  end
end
