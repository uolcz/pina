module Pina
  module Models
    class PurchaseItem
      include Virtus.model

      attribute :id
      attribute :department
      attribute :department_id
      attribute :creator
      attribute :creator_id
      attribute :modifier
      attribute :modifier_id
      attribute :product
      attribute :product_id
      attribute :contract
      attribute :contract_id
      attribute :created_at
      attribute :updated_at
      attribute :vat_rate

      attribute :batch
      attribute :reduce_vat_deduction
      attribute :percent_discount
      attribute :external_id
      attribute :invoice_id
      attribute :status
      attribute :description
      attribute :external_product_id
      attribute :quantity
      attribute :serial_numbers
      attribute :supplier_code
      attribute :total_price
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
