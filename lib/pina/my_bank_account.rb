require 'pina/models/my_bank_account'
require 'pina/collections/my_bank_account'

module Pina
  class MyBankAccount
    extend Pina::Resource

    resource_methods :all, :where, :find, :create, :update

    class << self
      def new(params = nil)
        Pina::Models::MyBankAccount.new(params)
      end
    end
  end
end
