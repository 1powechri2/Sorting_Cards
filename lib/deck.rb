require 'pry'
class Deck
  attr_reader :cards

  def initialize(cards = nil)
    @cards        = cards
    @cards_sorted = []
    @counter      = 0
  end

  def count
    @cards.length
  end

  def sort
    if @cards_sorted.length == @cards.length
      @cards_sorted
    else
      @cards.each do |card|
        if card.value.to_i == @counter
          @cards_sorted.push(card)
        end
      end
      @counter +=1
      sort
    end
  end

  def merge_sort
    if @cards_sorted.length == @cards.length
      @cards_sorted
    else
    half = @cards.length/2
    left = @cards.take(half)
    right = @cards.drop(half)
    binding.pry
      if left.first.value <= right.first.value
        @cards_sorted.push(left.first)
        left.shift
      else
        @cards_sorted.push(right.first)
        right.shift
      end
      merge_sort
    end
  end
end
