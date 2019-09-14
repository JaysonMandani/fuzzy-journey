# frozen_string_literal: true

# Identify the tax based on product
class TaxIdentifier
  NO_TAX_REGEX         = /pill|book|chocolate/.freeze
  IMPORTED_GOODS_REGEX = /\bimported\b/.freeze

  class << self
    def no_tax?(product)
      NO_TAX_REGEX =~ product
    end

    def imported_goods?(product)
      IMPORTED_GOODS_REGEX =~ product
    end
  end
end
