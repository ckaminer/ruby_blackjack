require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'

class PlayerTest < Minitest::Test
  def test_player_exists_with_cards
    p = Player.new
    assert_equal Player, p.class
    assert_equal Array, p.cards.class
    assert_equal 0, p.cards.length
  end
end
