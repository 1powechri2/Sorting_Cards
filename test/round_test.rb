require './test/test_helper'
require 'pry'

class RoundTest < Minitest::Test
  def setup
    card_1  = Card.new("3","Hearts")
    card_2  = Card.new("4", "Clubs")
    deck    = Deck.new([card_1, card_2])
    @round  = Round.new(deck)
  end

  def test_round_exitst
    assert_instance_of Round, @round
  end

  def test_round_can_hold_a_deck
    assert_instance_of Deck, @round.deck
  end

  def test_round_starts_with_0_guesses
    assert_equal [], @round.guesses
  end

  def test_counter_instantiates_at_0
    assert_equal 0, @round.counter
  end

  def test_current_card
    assert_equal "3", @round.current_card.value

    assert_equal "Hearts", @round.current_card.suit
  end

  def test_record_guess
    @round.record_guess("3 of Hearts")

    assert_equal Guess, @round.guesses.first.class
  end

  def test_count_guesses
    @round.record_guess("3 of Hearts")

    assert_equal 1, @round.guesses.count
  end

  def test_for_positive_feedback
    @round.record_guess("3 of Hearts")

    assert_equal "Correct!", @round.guesses.first.feedback
  end

  def test_number_correct
    @round.record_guess("3 of Hearts")

    assert_equal 1, @round.number_correct
  end

  def test_next_card
    @round.record_guess("3 of Hearts")

    assert_equal "4", @round.current_card.value

    assert_equal "Clubs", @round.current_card.suit
  end

  def test_second_guess
    @round.record_guess("3 of Hearts")

    @round.record_guess("Jack of Diamonds")

    assert_equal Guess, @round.guesses[1].class

    assert_equal 2, @round.guesses.count

    assert_equal "Incorrect.", @round.guesses.last.feedback

    assert_equal 1, @round.number_correct
  end

  def test_percent_correct
    @round.record_guess("3 of Hearts")

    @round.record_guess("Jack of Diamonds")

    assert_equal 50, @round.percent_correct
  end
end
