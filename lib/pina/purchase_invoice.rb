require 'pina/models/purchase_item'
require 'pina/models/purchase_invoice'
require 'pina/collections/purchase_invoice'

module Pina
  class PurchaseInvoice
    class << self
      def new(params = nil)
        Pina::Models::PurchaseInvoice.new(params)
      end

      def find(id)
        response = Pina::RestAdapter.get(:purchase_invoices, id)

        return Pina::Models::PurchaseInvoice.new(attributes(response)) if
          response.ok?

        response
      end

      def all(page = nil)
        response = Pina::RestAdapter.get(:purchase_invoices, page)

        return Pina::Collections::PurchaseInvoice.new(attributes(response)) if
          response.ok?

        response
      end

      def where(hash, _page = nil)
        response = Pina::RestAdapter.get(:purchase_invoices, hash)

        return Pina::Collections::PurchaseInvoice.new(attributes(response)) if
          response.ok?

        response
      end

      def create(purchase_invoice)
        response = Pina::RestAdapter.post(:purchase_invoices, purchase_invoice)

        return Pina::Models::PurchaseInvoice.new(attributes(response)) if
          response.ok?

        response
      end

      def update(id, purchase_invoice)
        response = Pina::RestAdapter.patch(:purchase_invoices, id, purchase_invoice)

        return Pina::Models::PurchaseInvoice.new(attributes(response)) if
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
