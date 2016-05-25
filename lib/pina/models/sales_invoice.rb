module Pina
  module Models
    class SalesInvoice
      include Virtus.model

      attribute :accounting_address
      attribute :accounting_address_id
      attribute :bank_account
      attribute :bank_account_id
      attribute :buyer_address
      attribute :buyer_address_id
      attribute :buyer
      attribute :buyer_id
      attribute :contract
      attribute :contract_id
      attribute :creator
      attribute :creator_id
      attribute :modifier
      attribute :modifier_id
      attribute :delivery_address
      attribute :delivery_address_id
      attribute :department
      attribute :department_id
      attribute :document_recipient_address
      attribute :document_recipient_address_id
      attribute :order
      attribute :order_id
      attribute :shipper
      attribute :shipper_id
      attribute :linked_doc
      attribute :linked_doc_number
      attribute :items, Array[SalesItem]

      attribute :cancellation_date
      attribute :constant_symbol
      attribute :consumption_country_id
      attribute :created_at
      attribute :currency_id
      attribute :delivery_note
      attribute :delivery_note_note
      attribute :delivery_note_text
      attribute :due_date
      attribute :exchange_rate
      attribute :external_id
      attribute :invoice_id
      attribute :issue_date
      attribute :logo
      attribute :note
      attribute :payment_method
      attribute :percent_discount
      attribute :public_id
      attribute :response
      attribute :rounding
      attribute :send_by_email
      attribute :send_by_mail
      attribute :shipping_method
      attribute :specific_symbol
      attribute :status
      attribute :tax_payment_date
      attribute :text
      attribute :total_amount
      attribute :type
      attribute :type
      attribute :updated_at
      attribute :variable_symbol
      attribute :vat1_amount
      attribute :vat2_amount
      attribute :vat3_amount
      attribute :vat_document

      def self.to_s
        'sales_invoice'
      end

      def accounting_address=(value)
        return unless value

        self.accounting_address_id = value.values[0]
        super
      end

      def bank_account=(value)
        return unless value

        self.bank_account_id = value.values[0]
        super
      end

      def buyer_address=(value)
        return unless value

        self.buyer_address_id = value.values[0]
        super
      end

      def buyer=(value)
        return unless value

        self.buyer_id = value['_meta']['href'].split('/').last
        super
      end

      def contract=(value)
        return unless value

        self.contract_id = value.values[0]
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

      def document_recipient_address=(value)
        return unless value

        self.document_recipient_address_id = value.values[0]
        super
      end

      def order=(value)
        return unless value

        self.order_id = value.values[0]
        super
      end

      def linked_doc=(value)
        return unless value

        self.linked_doc_number = value.values[0]
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
