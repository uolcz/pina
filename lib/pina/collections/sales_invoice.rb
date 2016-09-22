module Pina
  module Collections
    class SalesInvoice < Base
      attribute :items, Array[::Pina::Models::SalesInvoice]
    end
  end
end
