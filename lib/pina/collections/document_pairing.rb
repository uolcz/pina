module Pina
  module Collections
    class DocumentPairing < Base
      attribute :items, Array[::Pina::Models::DocumentPairing]
    end
  end
end
