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

  def total_sales
    format('%.2f', items.map(&:item_with_tax).map(&:to_f).sum)
  end

  def total_taxes
    format('%.2f', items.map(&:computed_tax).map(&:to_f).sum)
  end

  def show_receipt
    string = ''
    items.each do |item|
      string.concat item.details
      string.concat("\n")
    end
    string.concat("\nSales Taxes: #{total_taxes}")
    string.concat("\nTotal: #{total_sales}\n")
    string
  end
end
