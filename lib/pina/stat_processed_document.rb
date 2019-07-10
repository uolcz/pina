require 'pina/models/stat_processed_document'
require 'pina/collections/stat_processed_document'

module Pina
  class StatProcessedDocument
    class << self
      def new(params = nil)
        Pina::Models::StatProcessedDocument.new(params)
      end

      def find(id)
        response = Pina::RestAdapter.get(:stat_processed_documents, id)

        return Pina::Models::StatProcessedDocument.new(attributes(response)) if
          response.ok?

        response
      end

      def where(hash, _page = nil)
        response = Pina::RestAdapter.get(:stat_processed_documents, hash)

        return Pina::Collections::StatProcessedDocument.new(attributes(response)) if
          response.ok?

        response
      end

      def all(page = nil)
        response = Pina::RestAdapter.get(:stat_processed_documents, page)

        return Pina::Collections::StatProcessedDocument.new(attributes(response)) if
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
