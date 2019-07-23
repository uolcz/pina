require 'pina/models/petty_cash_income'
require 'pina/collections/petty_cash_income'

module Pina
  class PettyCashIncome
    extend Pina::Resource

    resource_methods :all, :find
  end
end
