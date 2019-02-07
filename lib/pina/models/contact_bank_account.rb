module Pina
  module Models
    class ContactBankAccount
      include Virtus.model

      attribute :bank_account_id
      attribute :bank_account
      attribute :bank_code
      attribute :country
      attribute :country_id
      attribute :creator
      attribute :creator_id
      attribute :created_at
      attribute :currency
      attribute :currency_id
      attribute :default
      attribute :external_id
      attribute :iban
      attribute :modifier
      attribute :modifier_id
      attribute :name
      attribute :published
      attribute :status
      attribute :updated_at

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
