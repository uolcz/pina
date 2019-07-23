require 'pina/models/document_pairing'
require 'pina/collections/document_pairing'

module Pina
  class DocumentPairing
    extend Pina::Resource

    resource_methods :all
  end
end
