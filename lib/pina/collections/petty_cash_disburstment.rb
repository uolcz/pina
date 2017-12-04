module Pina
  module Collections
    class PettyCashDisburstment
      include Virtus.model

      attribute :items, Array[Pina::Models::PettyCashDisburstment]
    end
  end
end
