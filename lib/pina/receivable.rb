require 'pina/models/receivable'
require 'pina/collections/receivable'

module Pina
  class Receivable
    extend Pina::Resource

    resource_methods :all, :where, :find

    class << self
      def new(params = nil)
        Pina::Models::Receivable.new(params)
      end
    end
  end
end
