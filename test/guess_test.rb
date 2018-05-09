require './test/test_helper'
require 'pry'

class GuessTest < Minitest::Test
  def setup
    card  = Card.new("10", "Hearts")
    @guess = Guess.new("10 of Hearts", card)
  end
  def test_guess_exists
    assert_instance_of Guess, @guess
  end

  def test_second_parameter_inits_a_card_instance
    assert_instance_of Card, @guess.card
  end

  def test_response
    assert_equal "10 of Hearts", @guess.response
  end

  def test_guess_is_correct
    assert @guess.correct?
  end

  def test_feedback_is_positive
    assert_equal "Correct!", @guess.feedback
  end

  def test_guess_is_incorrect
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)

    refute guess.correct?
  end

  def test_feedback_is_negative
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)

    assert_equal "Incorrect.", guess.feedback
  end
end
