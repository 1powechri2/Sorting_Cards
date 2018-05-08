require './test/test_helper'
require 'pry'

class DeckTest < Minitest::Test
  def test_deck_exitsts
    deck = Deck.new

    assert_instance_of Deck, deck
  end

  def test_cards_passed_into_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck   = Deck.new([card_1, card_2, card_3])

    assert_equal [card_1, card_2, card_3], deck.cards
  end
  def test_deck_count
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck   = Deck.new([card_1, card_2, card_3])

    assert_equal 3, deck.count
  end

  def test_sort
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("3", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])

    assert_equal [card_2, card_1, card_3], deck.sort
  end
end
