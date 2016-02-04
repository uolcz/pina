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
      attribute :creator
      attribute :creator_id
      attribute :email
      attribute :external_id
      attribute :hidden
      attribute :mobile_phone
      attribute :modifier
      attribute :modifier_id
      attribute :name
      attribute :phone
      attribute :postal_code
      attribute :response
      attribute :status
      attribute :street
      attribute :updated_at
      attribute :url
      attribute '_destroy'

      def creator=(value)
        return unless value

        self.creator_id = value.values[0]
        super
      end

      def modifier=(value)
        return unless value

        self.modifier_id = value.values[0]
        super
      end
    end
  end
end
