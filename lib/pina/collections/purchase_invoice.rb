module Pina
  module Collections
    class PurchaseInvoice < Base
      attribute :items, Array[::Pina::Models::PurchaseInvoice]
    end
  end
end
