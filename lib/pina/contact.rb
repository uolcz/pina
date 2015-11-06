require 'base64'

module Pina
  class Contact
    def self.find(id)
      response = Pina::RestAdapter.get(:contacts, id)

      if response.ok?
        return Pina::Models::Contact.new(response.to_hash)
      end

      response
    end

    def self.all
    end
  end
end
