# frozen_string_literal: true

require 'cart'
require 'item'

RSpec.describe Item do
  describe 'methods' do
    let(:item) { Item.new('quantity' => 1, 'product' => 'book', 'price' => 12.49) }
    let(:imported_item) { Item.new('quantity' => 1, 'product' => 'imported goods', 'price' => 10.00) }
    let(:other_item) { Item.new('quantity' => 1, 'product' => 'perfumes', 'price' => 18.99) }

    it 'Should have item with tax' do
      expect(item.item_with_tax).to eq('12.49')
    end

    it 'Should have no tax rate' do
      expect(item.computed_tax).to eq(0.0)
    end

    it 'Should have item details' do
      expect(item.details).to eq('1, book, 12.49')
    end

    it 'Should have tax rate for imported product' do
      expect(imported_item.computed_tax).to eq(1.5)
    end

    it 'Should have tax rate for other product' do
      expect(other_item.computed_tax).to eq(1.9)
    end
  end
end
