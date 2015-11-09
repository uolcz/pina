module Pina
  module Models
    class Address
      include Virtus.model

      attribute :building_number
      attribute :city
      attribute :email
      attribute :mobile_phone
      attribute :name
      attribute :phone
      attribute :postal_code
      attribute :street
      attribute :url
    end
  end
end
