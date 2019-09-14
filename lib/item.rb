# frozen_string_literal: true

require_relative 'tax_identifier'

# Identify the items with tax
class Item
  attr_reader :quantity, :product, :price

  def initialize(item)
    @quantity = item['quantity']
    @product  = item['product']
    @price    = item['price'].to_f
  end

  def item_with_tax
    format('%.2f', price + computed_tax)
  end

  def computed_tax
    tax_calculator
  end

  def details
    "#{quantity}, #{product}, #{item_with_tax}"
  end

  private

  def tax_calculator
    rate = 0
    rate += (price * 0.1)  unless TaxIdentifier.no_tax? product
    rate += (price * 0.05) if TaxIdentifier.imported_goods? product
    round_of(rate)
  end

  def round_of(num)
    (num * 20).ceil / 20.0
  end
end
