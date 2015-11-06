module Pina
  module Models
    class Contact
      include Virtus.model

      attribute :name
      attribute :addresses, Array[Address]
    end
  end
end
