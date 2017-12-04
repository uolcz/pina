require 'pina/models/petty_cash_disburstment'
require 'pina/collections/petty_cash_disburstment'

module Pina
  class PettyCashDisburstment
    class << self
      def find(gid)
        response = Pina::RestAdapter.get(:petty_cash_disburstments, gid)

        return Pina::Models::PettyCashDisburstment.new(attributes(response)) if
          response.ok?

        response
      end

      def all
        response = Pina::RestAdapter.get(:petty_cash_disburstments)

        return Pina::Collections::PettyCashDisburstment.new(attributes(response)) if
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
