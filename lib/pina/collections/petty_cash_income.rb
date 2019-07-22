module Pina
  module Collections
    class PettyCashIncome
      include Virtus.model

      attribute :items, Array[Pina::Models::PettyCashIncome]
    end
  end
end
