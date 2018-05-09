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
    # order halves
    # merge splits
  end

  def split_cards(cards)
    cards.each_slice(2).to_a
  end

  def sort_pairs(arr)
    arr.map do |sub_arr|
      if sub_arr[1] == nil
        sub_arr
      elsif sub_arr[0].value > sub_arr[1].value
        sub_arr[0],sub_arr[1] = sub_arr[1],sub_arr[0]
      end
    end
  end
end
