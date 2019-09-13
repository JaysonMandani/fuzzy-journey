# frozen_string_literal: false

# Process the items price with tax using this cart.
class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add(item)
    items << item
  end

  def total
    items.map(&:item_with_tax).reduce(:+)
  end

  def computed_tax
    items.map(&:tax).reduce(:+)
  end

  def show_receipt
    string = ''
    items.each do |item|
      string.concat item.show
      string.concat("\n")
    end
    string
  end
end
