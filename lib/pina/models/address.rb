module Pina
  module Models
    class Address
      include Virtus.model

      attribute :building_number
      attribute :street
    end
  end
end
