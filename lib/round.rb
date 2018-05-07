require './lib/guess'

class Round
  attr_reader :deck,
              :guesses,
              :counter

  def initialize(deck = nil)
    @deck    = deck
    @guesses = []
    @counter = 0
  end

  def current_card
    @deck.cards[@counter]
  end

  def record_guess(guess)
    @guesses.push(Guess.new(guess, @deck.cards[@counter]))
  end

  def number_correct
    numb_correct = 0
    if @guesses[@counter].correct? == true
      numb_correct += 1
    end
  end
end
