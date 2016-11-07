module Pina
  module Collections
    class ProcessedDocument < Base
      attribute :items, Array[::Pina::Models::ProcessedDocument]
    end
  end
end
