require 'pina/models/petty_cash_disburstment'
require 'pina/collections/petty_cash_disburstment'

module Pina
  class PettyCashDisburstment
    extend Pina::Resource

    resource_methods :all, :find
  end
end
