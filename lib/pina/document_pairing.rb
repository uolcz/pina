require 'pina/models/document_pairing'
require 'pina/collections/document_pairing'

module Pina
  class DocumentPairing
    class << self
      def all(page = nil)
        response = Pina::RestAdapter.get(:document_pairings, page)

        return Pina::Collections::DocumentPairing.new(attributes(response)) if
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
