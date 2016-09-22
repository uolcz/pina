module Pina
  class SalesInvoice
    class << self
      def new(params = nil)
        Pina::Models::SalesInvoice.new(params)
      end

      def find(id)
        response = Pina::RestAdapter.get(:sales_invoices, id)

        return Pina::Models::SalesInvoice.new(attributes(response)) if
          response.ok?

        response
      end

      def all(page = nil)
        response = Pina::RestAdapter.get(:sales_invoices, page)

        return Pina::Collections::SalesInvoice.new(attributes(response)) if
          response.ok?

        response
      end

      def create(sales_invoice)
        response = Pina::RestAdapter.post(:sales_invoices, sales_invoice)

        return Pina::Models::SalesInvoice.new(attributes(response)) if
          response.ok?

        response
      end

      def update(id, sales_invoice)
        response = Pina::RestAdapter.patch(:sales_invoices, id, sales_invoice)

        return Pina::Models::SalesInvoice.new(attributes(response)) if
          response.ok?

        response
      end

      private

      def attributes(response)
        response.to_hash.merge(response: response)
      end
    end
  end
end
