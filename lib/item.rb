# frozen_string_literal: false

# Identify the items with tax
class Item
  attr_reader :quantity, :product, :price

  def initialize(item)
    @quantity = item['quantity']
    @product  = item['product']
    @price    = item['price']
  end

  def item_with_tax
    price + tax
  end

  def tax
    tax_calculator
  end

  def show
    "#{quantity} #{product} #{price}"
  end

  private

  def tax_calculator
    # calculator
  end

  def round_of(num)
    (num * 20).ceil / 20.0
  end
end
