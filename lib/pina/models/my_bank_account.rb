module Pina
  module Models
    class MyBankAccount
      include Virtus.model

      attribute :created_at
      attribute :updated_at
      attribute :creator
      attribute :creator_id
      attribute :modifier
      attribute :modifier_id
      attribute :opening_balance_date
      attribute :bank_account
      attribute :bank_account_id
      attribute :bank_code
      attribute :country
      attribute :country_id
      attribute :currency
      attribute :currency_id
      attribute :statement_download_interval
      attribute :statement_download_type
      attribute :order_type
      attribute :statement_encoding
      attribute :external_id
      attribute :statement_type
      attribute :iban
      attribute :default
      attribute :hidden
      attribute :officially_published
      attribute :send_order_to_bank
      attribute :download_type

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

      def country=(value)
        return unless value

        self.country_id = value.values[0]
        super
      end

      def currency=(value)
        return unless value

        self.currency_id = value.values[0]
        super
      end
    end
  end
end
