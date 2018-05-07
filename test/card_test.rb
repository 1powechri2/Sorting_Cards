require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card'

class CardTest < Minitest::Test
  def test_that_card_exists
    card = Card.new("Ace", "Spades")

    assert_instance_of Card, card
  end

  def test_card_value
    card = Card.new("Ace", "Spades")

    assert "Ace", card.value
  end

  def test_card_suit
    card = Card.new("Ace", "Spades")

    assert "Spades", card.suit
  end
end
