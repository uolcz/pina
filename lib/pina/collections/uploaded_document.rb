module Pina
  module Collections
    class UploadedDocument < Base
      attribute :items, Array[::Pina::Models::UploadedDocument]
    end
  end
end
