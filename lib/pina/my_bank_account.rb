require 'pina/models/my_bank_account'
require 'pina/collections/my_bank_account'

module Pina
  class MyBankAccount
    class << self
      def new(params = nil)
        Pina::Models::MyBankAccount.new(params)
      end

      def find(id)
        response = Pina::RestAdapter.get(:my_bank_accounts, id)

        return Pina::Models::MyBankAccount.new(attributes(response)) if
          response.ok?

        response
      end

      def all(page = nil)
        response = Pina::RestAdapter.get(:my_bank_accounts, page)

        return Pina::Collections::MyBankAccount.new(attributes(response)) if
          response.ok?

        response
      end

      def where(hash, _page = nil)
        response = Pina::RestAdapter.get(:my_bank_accounts, hash)

        return Pina::Collections::MyBankAccount.new(attributes(response)) if
          response.ok?

        response
      end

      def create(my_bank_account)
        response = Pina::RestAdapter.post(:my_bank_accounts, my_bank_account)

        return Pina::Models::MyBankAccount.new(attributes(response)) if
          response.ok?

        response
      end

      def update(id, my_bank_account)
        response = Pina::RestAdapter.patch(:my_bank_accounts, id, my_bank_account)

        return Pina::Models::MyBankAccount.new(attributes(response)) if
          response.ok?

        response
      end

      private

      def attributes(response)
        response.to_hash.merge(response: response)
      end
    end
  end
end
