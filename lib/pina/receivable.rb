require 'pina/models/receivable'
require 'pina/collections/receivable'

module Pina
  class Receivable
    class << self
      def new(params = nil)
        Pina::Models::Receivable.new(params)
      end

      def find(id)
        response = Pina::RestAdapter.get(:receivables, id)

        return Pina::Models::Receivable.new(attributes(response)) if
          response.ok?

        response
      end

      def where(hash, _page = nil)
        response = Pina::RestAdapter.get(:receivables, hash)

        return Pina::Collections::Receivable.new(attributes(response)) if
          response.ok?

        response
      end

      def all(page = nil)
        response = Pina::RestAdapter.get(:receivables, page)

        return Pina::Collections::Receivable.new(attributes(response)) if
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
