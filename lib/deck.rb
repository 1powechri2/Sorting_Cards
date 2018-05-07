class Deck
  attr_reader :cards

  def initialize(cards = nil)
    @cards = cards
  end

  def count
    @cards.length
  end
end
