module Pina
  module Models
    class Errors
      include Virtus.model

      attribute :resource
      attribute :field
      attribute :code
    end
  end
end
