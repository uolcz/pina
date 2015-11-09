require 'base64'

module Pina
  class Contact
    class << self
      def find(id)
        response = Pina::RestAdapter.get(:contacts, id)

        if response.ok?
          return Pina::Models::Contact.new(response.to_hash)
        end

        response
      end

      def all(page = nil)
        response = Pina::RestAdapter.get(:contacts, page)

        if response.ok?
          return Pina::Models::ContactList.new(response.to_hash)
        end

        response
      end

      def create(contact)
        response = Pina::RestAdapter.post(:contacts, contact)

        if response.ok?
          return Pina::Models::Contact.new(response.to_hash)
        end

        response
      end

      def update(id, contact)
        response = Pina::RestAdapter.patch(:contacts, id, contact)

        if response.ok?
          return Pina::Models::Contact.new(response.to_hash)
        end

        response
      end
    end
  end
end
