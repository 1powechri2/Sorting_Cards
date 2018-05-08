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
    @counter += 1
    @guesses.push(Guess.new(guess, @deck.cards[@counter -1]))
  end

  def number_correct
    numb_correct = 0
    @guesses.each do |guess|
      if guess.correct? == true
        numb_correct += 1
      end
    end
    numb_correct
  end

  def percent_correct
    (number_correct / @guesses.count.to_f) * 100
  end
end
