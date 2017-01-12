module Pina
  module Collections
    class MyBankAccount < Base
      attribute :items, Array[::Pina::Models::MyBankAccount]
    end
  end
end
