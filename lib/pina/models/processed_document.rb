module Pina
  module Models
    class ProcessedDocument
      include Virtus.model

      attribute :gid
      attribute :cuser
      attribute :ctime
      attribute :muser
      attribute :mtime
      attribute :isvalid
      attribute :islocked
      attribute :external_id
      attribute :status
      attribute :table
      attribute :period
      attribute :user
      attribute :number_of_created_documents
      attribute :document_creation_time
      attribute :number_of_modified_documents
      attribute :document_modification_time
      attribute :number_of_modified_original_documents
      attribute :original_document_modification_time
    end
  end
end
