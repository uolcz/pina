require 'pina/models/sales_item'
require 'pina/models/sales_order'
require 'pina/collections/sales_order'

module Pina
  class SalesOrder
    extend Pina::Resource

    resource_methods :all, :where, :find

    class << self
      def new(params = nil)
        Pina::Models::SalesOrder.new(params)
      end
    end
  end
end
