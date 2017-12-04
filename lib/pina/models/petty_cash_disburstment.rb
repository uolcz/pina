require 'pina/models/petty_cash_disburstment_item'
require 'pina/models/coercions/nested_value'

module Pina
  module Models
    class PettyCashDisburstment
      include Virtus.model

      attribute :created_at
      attribute :updated_at
      attribute :creator, NestedValue
      attribute :modifier, NestedValue
      attribute :items, Array[Pina::Models::PettyCashDisburstmentItem]
      attribute :number
      attribute :issue_date
      attribute :receipt_date
      attribute :note
      attribute :coefficient
      attribute :petty_cash, NestedValue
      attribute :department, NestedValue
      attribute :total
      attribute :contact, NestedValue
      attribute :contract, NestedValue
      attribute :vat_document
      attribute :confirmed
      attribute :status
      attribute :gid
    end
  end
end
