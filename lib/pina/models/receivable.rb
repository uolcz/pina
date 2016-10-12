module Pina
  module Models
    class Receivable
      include Virtus.model

      attribute :invoice_id
      attribute :contact_id
      attribute :total_amount
      attribute :total_amount_in_currency
      attribute :paid_amount
      attribute :paid_amount_in_currency
      attribute :paid_amount_currency_ids
      attribute :last_payment_time
      attribute :total_amount_currency_ids
      attribute :invoice_issue_date
      attribute :due_date
      attribute :tax_payment_date
      attribute :invoice_type
      attribute :invoice_amount
      attribute :invoice_exchange_rate
      attribute :department
      attribute :invoice_currency_id
    end
  end
end
