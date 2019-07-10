require 'pina/models/uploaded_document'
require 'pina/collections/uploaded_document'

module Pina
  class UploadedDocument
    class << self
      def create(uploaded_document)
        response = Pina::RestAdapter.post(:uploaded_documents, uploaded_document, multipart: true)

        if response.ok?
          Pina::Models::UploadedDocument.new(attributes(response))
        else
          Pina::Models::Error.new(attributes_for_error(response))
        end
      end

      def find(id)
        response = Pina::RestAdapter.get(:uploaded_documents, id)

        if response.ok?
          Pina::Models::UploadedDocument.new(attributes(response))
        else
          Pina::Models::Error.new(attributes_for_error(response))
        end
      end

      def where(hash, _page = nil)
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

        if response.ok?
          Pina::Models::UploadedDocument.new(attributes(response))
        else
          Pina::Models::Error.new(attributes_for_error(response))
        end
      end

      private

      def attributes(response)
        response.to_hash.merge(response: response)
      end

      def attributes_for_error(response)
        response.to_hash.merge(status_code: response.status_code)
      end
    end
  end
end
