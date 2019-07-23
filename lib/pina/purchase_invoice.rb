require 'pina/models/purchase_item'
require 'pina/models/purchase_invoice'
require 'pina/collections/purchase_invoice'

module Pina
  class PurchaseInvoice
    extend Pina::Resource

    resource_methods :all, :where, :find, :create, :update

    class << self
      def new(params = nil)
        Pina::Models::PurchaseInvoice.new(params)
      end
    end
  end
end
