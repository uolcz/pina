module Pina
  module Models
    class Error
      include Virtus.model

      attribute :status_code
      attribute :message
      attribute :errors, Array[Models::Errors]
        
      def ok?
        status_code == 200 || status_code == 201
      end
    end
  end
end
