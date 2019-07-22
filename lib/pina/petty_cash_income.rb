require 'pina/models/petty_cash_income'
require 'pina/collections/petty_cash_income'

module Pina
  class PettyCashIncome
    class << self
      def find(gid)
        response = Pina::RestAdapter.get(:petty_cash_incomes, gid)

        return Pina::Models::PettyCashIncome.new(attributes(response)) if
          response.ok?

        response
      end

      def all
        response = Pina::RestAdapter.get(:petty_cash_incomes)

        return Pina::Collections::PettyCashIncome.new(attributes(response)) if
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
