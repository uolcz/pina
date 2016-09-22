module Pina
  class SalesOrder
    class << self
      def new(params = nil)
        Pina::Models::SalesOrder.new(params)
      end

      def find(id)
        response = Pina::RestAdapter.get(:sales_orders, id)

        return Pina::Models::SalesOrder.new(attributes(response)) if
          response.ok?

        response
      end

      def all(page = nil)
        response = Pina::RestAdapter.get(:sales_orders, page)

        return Pina::Collections::SalesOrder.new(attributes(response)) if
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
