require 'pina/models/uploaded_document'
require 'pina/collections/uploaded_document'

module Pina
  class UploadedDocument
    class << self
      def find(id)
        response = Pina::RestAdapter.get(:uploaded_documents, id)

        return Pina::Models::UploadedDocument.new(attributes(response)) if
          response.ok?

        response
      end

      def where(hash, page = nil)
        response = Pina::RestAdapter.get(:uploaded_documents, hash)

        return Pina::Collections::UploadedDocument.new(attributes(response)) if
          response.ok?

        response
      end

      def all(page = nil)
        response = Pina::RestAdapter.get(:uploaded_documents, page)

        return Pina::Collections::UploadedDocument.new(attributes(response)) if
          response.ok?

        response
      end

      def update(id, uploaded_document)
        response = Pina::RestAdapter.patch(:uploaded_documents, id, uploaded_document)

        return Pina::Models::UploadedDocument.new(attributes(response)) if
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
