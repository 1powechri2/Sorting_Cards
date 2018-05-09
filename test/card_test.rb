require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card'

class CardTest < Minitest::Test
  def setup
    @card = Card.new("Ace", "Spades")
  end

  def test_that_card_exists

    assert_instance_of Card, @card
  end

  def test_card_value
    assert "Ace", @card.value
  end

  def test_card_suit
    assert "Spades", @card.suit
  end
end
