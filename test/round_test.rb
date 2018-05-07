require './test/test_helper'
require 'pry'

class RoundTest < Minitest::Test
  def test_round_exitst
    round = Round.new

    assert_instance_of Round, round
  end

  def test_round_can_hold_a_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    assert_instance_of Deck, round.deck
  end

  def test_round_starts_with_0_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_counter_instantiates_at_0
    round = Round.new

    assert_equal 0, round.counter
  end

  def test_current_card
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    assert_equal "3", round.current_card.value

    assert_equal "Hearts", round.current_card.suit
  end

  def test_record_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    round.record_guess("3 of Hearts")

    assert_equal Guess, round.guesses.first.class
  end

  def test_count_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    round.record_guess("3 of Hearts")

    assert_equal 1, round.guesses.count
  end

  def test_for_positive_feedback
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    round.record_guess("3 of Hearts")

    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_number_correct
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    round.record_guess("3 of Hearts")

    assert_equal 1, round.number_correct
  end
end
