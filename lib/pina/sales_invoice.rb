require 'pina/models/sales_item'
require 'pina/models/sales_invoice'
require 'pina/collections/sales_invoice'

module Pina
  class SalesInvoice
    extend Pina::Resource

    resource_methods :all, :where, :find, :create, :update

    class << self
      def new(params = nil)
        Pina::Models::SalesInvoice.new(params)
      end
    end
  end
end
