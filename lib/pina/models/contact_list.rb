module Pina
  module Models
    class ContactList
      include Virtus.model

      attribute :items, Array[Contact]
    end
  end
end
