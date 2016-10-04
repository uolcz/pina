module Pina
  module Models
    class Receivable
      include Virtus.model

      attribute :invoice_id
      attribute :invoice
      attribute :contact_id
      attribute :total_amount
      attribute :total_amount_in_currency
      attribute :paid_amount
      attribute :paid_amount_in_currency
      attribute :paid_amount_currency_ids
      attribute :last_payment_time

      def invoice_id=(value)
        return unless value

        self.invoice = Pina::SalesInvoice.find(value)
        super
      end
    end
  end
end
