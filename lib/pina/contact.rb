require 'pina/models/address'
require 'pina/models/contact_bank_account'
require 'pina/models/contact'
require 'pina/collections/contact'

module Pina
  class Contact
    class << self
      def new(params = nil)
        Pina::Models::Contact.new(params)
      end

      def find_by(hash)
        response = where(hash)

        return response.items.first if response.is_a? Pina::Collections::Contact

        response
      end

      def where(hash, page = nil)
        response = Pina::RestAdapter.get(:contacts, hash)

        return Pina::Collections::Contact.new(attributes(response)) if
          response.ok?

        response
      end

      def find(id)
        response = Pina::RestAdapter.get(:contacts, id)

        return Pina::Models::Contact.new(attributes(response)) if response.ok?

        response
      end

      def all(page = nil)
        response = Pina::RestAdapter.get(:contacts, page)

        return Pina::Collections::Contact.new(attributes(response)) if
          response.ok?

        response
      end

      def create(contact)
        response = Pina::RestAdapter.post(:contacts, contact)

        return Pina::Models::Contact.new(attributes(response)) if response.ok?

        response
      end

      def update(id, contact)
        response = Pina::RestAdapter.patch(:contacts, id, contact)

        return Pina::Models::Contact.new(attributes(response)) if response.ok?

        response
      end

      private

      def attributes(response)
        response.to_hash.merge(response: response)
      end
    end
  end
end
