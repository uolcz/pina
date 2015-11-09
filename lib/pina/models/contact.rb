module Pina
  module Models
    class Contact
      include Virtus.model

      attribute :addresses, Array[Address]
      attribute :business_entity
      attribute :country_id
      attribute :email
      attribute :name
      attribute :note
      attribute :phone
      attribute :specific_symbol
      attribute :url
      attribute :vatin
    end
  end
end
