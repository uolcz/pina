module Pina
  module Collections
    class Base
      include Virtus.model
      include Pina::Utils::Pagination

      attribute :_meta
      attribute :response
    end
  end
end
