require 'pina/models/processed_document'
require 'pina/collections/processed_document'

module Pina
  class ProcessedDocument
    extend Pina::Resource

    resource_methods :all, :where, :find, :delete

    class << self
      def new(params = nil)
        Pina::Models::ProcessedDocument.new(params)
      end
    end
  end
end
