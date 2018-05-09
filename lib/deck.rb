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
    deck_split = split_cards(@cards)
    sorted_pairs = sort_pairs(deck_split)
    split_sorted_pairs(sorted_pairs)
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

  def split_sorted_pairs(sorted_pairs)
    cards_for_merge = Hash.new
    sorted_pairs.each_with_index do |array, index|
      cards_for_merge[index] = array
    end
    cards_for_merge
  end
end
