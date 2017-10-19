module Pina
  module Models
    class StatProcessedDocument
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
      attribute :manually_processed
      attribute :table
      attribute :date
      attribute :user
      attribute :type
      attribute :count
      attribute :min
      attribute :max
    end
  end
end
