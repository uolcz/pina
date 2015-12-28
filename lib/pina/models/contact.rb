module Pina
  module Models
    class Contact
      include Virtus.model

      attribute :acquisition_country_id
      attribute :addresses, Array[Address]
      attribute :business_entity
      attribute :consumption_country_id
      attribute :contact_id
      attribute :contract_id
      attribute :country_id
      attribute :created_at
      attribute :creator, Hash
      attribute :days_till_due_date
      attribute :department_id
      attribute :duplicate_variable_symbol
      attribute :email
      attribute :external_id
      attribute :hidden
      attribute :import_received_documents
      attribute :language_id
      attribute :mobile_phone
      attribute :modifier_id
      attribute :name
      attribute :note
      attribute :percent_discount
      attribute :phone
      attribute :price_list, Hash
      attribute :response
      attribute :status
      attribute :sipo_number
      attribute :specific_symbol
      attribute :tin
      attribute :unreliable_payer
      attribute :updated_at
      attribute :url
      attribute :vat_payer
      attribute :vatin
    end
  end
end
