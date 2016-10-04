module Pina
  module Collections
    class Receivable < Base
      attribute :items, Array[::Pina::Models::Receivable]
    end
  end
end
