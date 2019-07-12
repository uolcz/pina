require 'pina/models/uploaded_document'
require 'active_support/inflector'
require 'active_support/core_ext/hash/keys'

module Pina
  module Models
    class DocumentPairing
      include Virtus.model

      attribute :uploaded_document, ::Pina::Models::UploadedDocument

      attribute :document_pairable_type
      attribute :document_pairable_id

      attribute :created_at, DateTime

      def initialize(attributes = {}, *args)
        extend(Virtus.model)

        document_type = attributes.symbolize_keys[:document_pairable_type]
        document_pairable_attribute(document_type)

        super
      end

      private

      def document_pairable_attribute(document_type)
        return unless document_type

        attribute(:document_pairable, document_klass(document_type))
      end

      def document_klass(document_type)
        model = document_type.camelize
        return unless Pina::Models.const_defined?(model)

        Pina::Models.const_get(model)
      end
    end
  end
end
