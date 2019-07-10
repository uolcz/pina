module Pina
  module Models
    class PurchaseInvoice
      include Virtus.model

      attribute :seller
      attribute :seller_id
      attribute :contract
      attribute :contract_id
      attribute :creator
      attribute :creator_id
      attribute :modifier
      attribute :modifier_id
      attribute :department
      attribute :department_id
      attribute :order
      attribute :order_id
      attribute :shipper
      attribute :shipper_id
      attribute :items, Array[PurchaseItem]

      attribute :date_of_receipt
      attribute :due_date
      attribute :issue_date
      attribute :tax_payment_date

      attribute :bank_code
      attribute :bank_country_id
      attribute :iban_or_account
      attribute :account_number
      attribute :reduce_vat_deduction
      attribute :constant_symbol
      attribute :percent_discount
      attribute :external_id
      attribute :iban
      attribute :invoice_id
      attribute :gid
      attribute :status
      attribute :isdoc
      attribute :note
      attribute :payment_method
      attribute :exchange_rate
      attribute :rounding
      attribute :shipping_method
      attribute :specific_symbol
      attribute :total_amount
      attribute :type
      attribute :vat_document
      attribute :vat1_amount
      attribute :vat2_amount
      attribute :vat3_amount
      attribute :variable_symbol
      attribute :public_id

      def self.to_s
        'purchase_invoice'
      end

      def account_number=(value)
        return unless value

        self.iban_or_account = value
        super
      end

      def iban=(value)
        return unless value

        self.iban_or_account ||= value
        super
      end

      def seller=(value)
        return unless value

        self.seller_id = value['_meta']['href'].split('/').last
        super
      end

      def shipper=(value)
        return unless value
        return unless value['_meta']

        self.shipper_id = value['_meta']['href'].split('/').last
        super
      end

      def department=(value)
        return unless value

        self.department_id = value.values[0]
        super
      end

      def contract=(value)
        return unless value

        self.contract_id = value.values[0]
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
