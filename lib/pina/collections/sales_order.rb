module Pina
  module Collections
    class SalesOrder < Base
      attribute :items, Array[::Pina::Models::SalesOrder]
    end
  end
end
