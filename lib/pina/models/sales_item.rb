module Pina
  module Models
    class SalesItem
      include Virtus.model

      attribute :id
      attribute :department
      attribute :department_id
      attribute :creator
      attribute :creator_id
      attribute :delivery
      attribute :delivery_id
      attribute :modifier
      attribute :modifier_id
      attribute :product
      attribute :product_id
      attribute :contract
      attribute :contract_id
      attribute :batch
      attribute :created_at
      attribute :description
      attribute :expiration_date
      attribute :external_id
      attribute :percent_discount
      attribute :quantity
      attribute :serial_numbers
      attribute :status
      attribute :supplier_code
      attribute :unit_price
      attribute :updated_at
      attribute :vat_rate
      attribute '_destroy'

      def department=(value)
        return unless value

        self.department_id = value.values[0]
        super
      end

      def creator=(value)
        return unless value

        self.creator_id = value.values[0]
        super
      end

      def delivery=(value)
        return unless value

        self.delivery_id = value.values[0]
        super
      end

      def modifier=(value)
        return unless value

        self.modifier_id = value.values[0]
        super
      end

      def product=(value)
        return unless value

        self.product_id = value.values[0]
        super
      end

      def contract=(value)
        return unless value

        self.contract_id = value.values[0]
        super
      end
    end
  end
end
