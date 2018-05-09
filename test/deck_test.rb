require './test/test_helper'
require 'pry'

class DeckTest < Minitest::Test
  def setup
    @card_1 = Card.new("4","Hearts")
    @card_2 = Card.new("3", "Clubs")
    @card_3 = Card.new("5", "Diamonds")
    @deck   = Deck.new([@card_1, @card_2, @card_3])
  end

  def test_deck_exitsts
    assert_instance_of Deck, @deck
  end

  def test_cards_passed_into_deck
    assert_equal [@card_1, @card_2, @card_3], @deck.cards
  end
  def test_deck_count
    assert_equal 3, @deck.count
  end

  def test_sort
    assert_equal [@card_2, @card_1, @card_3], @deck.sort
  end

  def test_split_cards
    actual   = @deck.split_cards(@deck.cards)
    expected = [[@card_1, @card_2], [@card_3]]
    assert_equal expected, actual
  end

  def test_sort_pairs
    pairs = @deck.split_cards(@deck.cards)
    actual = @deck.sort_pairs(pairs)
    expected = [[@card_2, @card_1], [@card_3]]
    assert_equal expected, actual
  end
end
