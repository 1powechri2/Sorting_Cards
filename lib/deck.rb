class Deck
  attr_reader :cards

  def initialize(cards = nil)
    @cards = cards
  end

  def count
    @cards.length
  end

  def sort
    @cards.min_by(@cards.length) do |card|
      card.value
    end
  end
end
