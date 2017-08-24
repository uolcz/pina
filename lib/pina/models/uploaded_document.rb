module Pina
  module Models
    class UploadedDocument
      include Virtus.model

      attribute :id
      attribute :file
      attribute :created_at
      attribute :state
      attribute :note
    end
  end
end
