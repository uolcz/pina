require 'pina/models/processed_document'
require 'pina/collections/processed_document'

module Pina
  class ProcessedDocument
    class << self
      def new(params = nil)
        Pina::Models::ProcessedDocument.new(params)
      end

      def find(id)
        response = Pina::RestAdapter.get(:processed_documents, id)

        return Pina::Models::ProcessedDocument.new(attributes(response)) if
          response.ok?

        response
      end

      def where(hash, _page = nil)
        response = Pina::RestAdapter.get(:processed_documents, hash)

        return Pina::Collections::ProcessedDocument.new(attributes(response)) if
          response.ok?

        response
      end

      def all(page = nil)
        response = Pina::RestAdapter.get(:processed_documents, page)

        return Pina::Collections::ProcessedDocument.new(attributes(response)) if
          response.ok?

        response
      end

      def delete(id)
        response = Pina::RestAdapter.delete(:processed_documents, id)

        return Pina::Models::ProcessedDocument.new(attributes(response)) if
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
