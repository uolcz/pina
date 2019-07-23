require 'pina/models/uploaded_document_pairing'

module Pina
  class UploadedDocumentPairing
    extend Pina::Resource

    class << self
      def find(id)
        response = Pina::RestAdapter.get([:uploaded_documents, id, :pairings])

        return Pina::Models::UploadedDocumentPairing.new(attributes(response)) if
          response.ok?

        response
      end

      def create(params)
        response = Pina::RestAdapter.post([:uploaded_documents, params[:uploaded_document_id], :pairings],
                                          params.except(:uploaded_document_id))

        if response.ok?
          # TODO: implement uploaded_documents/:id/pairings response object in Fantozzi api
          response
        else
          Pina::Models::Error.new(attributes_for_error(response))
        end
      end

      private

      def attributes_for_error(response)
        response.to_hash.merge(status_code: response.status_code)
      end
    end
  end
end
