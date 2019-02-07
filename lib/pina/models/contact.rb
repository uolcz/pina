module Pina
  module Models
    class Contact
      include Virtus.model

      attribute :acquisition_country_id
      attribute :addresses, Array[Address]
      attribute :bank_accounts, Array[ContactBankAccount]
      attribute :business_entity
      attribute :company_number
      attribute :consumption_country_id
      attribute :contact_id
      attribute :contract_id
      attribute :country_id
      attribute :created_at
      attribute :creator
      attribute :creator_id
      attribute :days_till_due_date
      attribute :department_id
      attribute :duplicate_variable_symbol
      attribute :external_id
      attribute :hidden
      attribute :import_received_documents
      attribute :language_id
      attribute :modifier
      attribute :modifier_id
      attribute :name
      attribute :note
      attribute :percent_discount
      attribute :price_list
      attribute :price_list_id
      attribute :response
      attribute :status
      attribute :sipo_number
      attribute :specific_symbol
      attribute :tin
      attribute :unreliable_payer
      attribute :updated_at
      attribute :vat_payer
      attribute :vatin

      def self.to_s
        'contact'
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

      def price_list=(value)
        return unless value

        self.price_list_id = value.values[0]
        super
      end
    end
  end
end
