require 'pina/models/coercions/nested_value'

module Pina
  module Models
    class PettyCashDisburstmentItem
      include Virtus.model

      attribute :created_at
      attribute :updated_at
      attribute :creator, NestedValue
      attribute :modifier, NestedValue
      attribute :external_id
      attribute :rule_id, NestedValue
      attribute :variable_symbol
      attribute :price
      attribute :description
      attribute :department, NestedValue
      attribute :contract, NestedValue
      attribute :linked_doc_number
    end
  end
end
