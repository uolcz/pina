module Pina
  module Models
    class SalesOrder
      include Virtus.model

      attribute :created_at
      attribute :updated_at
      attribute :creator
      attribute :creator_id
      attribute :modifier
      attribute :modifier_id
      attribute :accounting_address
      attribute :accounting_address_id
      attribute :buyer_address
      attribute :buyer_address_id
      attribute :document_recipient_address
      attribute :document_recipient_address_id
      attribute :delivery_address
      attribute :delivery_address_id
      attribute :contact
      attribute :currency
      attribute :currency_id
      attribute :date_of_receipt
      attribute :delivery_method
      attribute :department
      attribute :department_id
      attribute :percent_discount
      attribute :external_id
      attribute :fullfilled_on
      attribute :group_id
      attribute :invoicing_method
      attribute :status
      attribute :order
      attribute :order_id
      attribute :contract
      attribute :shipper_id
      attribute :shipping_method
      attribute :specific_symbol
      attribute :payment_method
      attribute :complete_upon_execution
      attribute :items, Array[::Pina::Models::SalesItem]

      def self.to_s
        'sales_order'
      end

      def accounting_address=(value)
        return unless value

        self.accounting_address_id = value.values[0]
        super
      end


      def buyer_address=(value)
        return unless value

        self.buyer_address_id = value.values[0]
        super
      end

      def delivery_address=(value)
        return unless value

        self.delivery_address_id = value.values[0]
        super
      end

      def department=(value)
        return unless value

        self.department_id = value.values[0]
        super
      end

      def order=(value)
        return unless value

        self.order_id = value.values[0]
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
    end
  end
end
