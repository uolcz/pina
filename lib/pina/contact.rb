require 'pina/models/address'
require 'pina/models/contact_bank_account'
require 'pina/models/contact'
require 'pina/collections/contact'

module Pina
  class Contact
    extend Pina::Resource

    resource_methods :all, :where, :find, :create, :update

    class << self
      def new(params = nil)
        Pina::Models::Contact.new(params)
      end

      def find_by(hash)
        response = where(hash)

        return response.items.first if response.is_a? Pina::Collections::Contact

        response
      end
    end
  end
end
