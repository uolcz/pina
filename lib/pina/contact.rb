module Pina
  class Contact
    class << self
      def new(params = nil)
        Pina::Models::Contact.new(params)
      end

      def find(id)
        response = Pina::RestAdapter.get(:contacts, id)

        return Pina::Models::Contact.new(attributes(response)) if response.ok?

        response
      end

      def all(page = nil)
        response = Pina::RestAdapter.get(:contacts, page)

        return Pina::Models::ContactList.new(attributes(response)) if
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
