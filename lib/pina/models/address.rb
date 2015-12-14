module Pina
  module Models
    class Address
      include Virtus.model

      attribute :address_id
      attribute :address_types, Array
      attribute :building_number
      attribute :city
      attribute :country_id
      attribute :created_at
      attribute :creator, Hash
      attribute :email
      attribute :external_id
      attribute :hidden
      attribute :mobile_phone
      attribute :modifier, Hash
      attribute :name
      attribute :phone
      attribute :postal_code
      attribute :response
      attribute :status
      attribute :street
      attribute :updated_at
      attribute :url
      attribute '_destroy'
    end
  end
end
