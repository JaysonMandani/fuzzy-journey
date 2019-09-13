# frozen_string_literal: true

require_relative 'cart'
require_relative 'item'
require 'csv'

# Execute the whole function and display receipts
class SalesTaxes
  class Error < StandardError; end

  def self.print_receipt
    Dir.entries('test_inputs').sort.each do |file|
      next unless /^.+\.csv$/ =~ file

      cart = Cart.new
      CSV.foreach("test_inputs/#{file}", headers: true) do |row|
        cart.add(Item.new(row.to_h))
      end

      print "Receipt for #{file} \n"
      print cart.show_receipt
      print "\n"
    end
  end
end

SalesTaxes.print_receipt
