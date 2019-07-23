require 'pina/models/stat_processed_document'
require 'pina/collections/stat_processed_document'

module Pina
  class StatProcessedDocument
    extend Pina::Resource

    resource_methods :all, :where, :find

    class << self
      def new(params = nil)
        Pina::Models::StatProcessedDocument.new(params)
      end
    end
  end
end
