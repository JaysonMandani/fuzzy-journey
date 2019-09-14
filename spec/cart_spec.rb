# frozen_string_literal: true

require 'cart'
require 'item'

RSpec.describe Cart do
  describe 'methods' do
    let(:cart) { Cart.new }

    before do
      item = Item.new('quantity' => 1, 'product' => 'imported box of chocolates', 'price' => 10.00)
      cart.add(item)
    end

    it 'Should add an item' do
      expect(cart.items.first.price).to eq(10.00)
    end

    it 'Should have total sales' do
      expect(cart.total_sales).to eq('10.50')
    end

    it 'Should have total taxes' do
      expect(cart.total_taxes).to eq('0.50')
    end

    it 'Should show receipt' do
      expect(cart.show_receipt).to eq("1, imported box of chocolates, 10.50\n\nSales Taxes: 0.50\nTotal: 10.50\n")
    end
  end
end
