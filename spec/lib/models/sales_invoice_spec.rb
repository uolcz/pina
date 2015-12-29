require 'spec_helper'

describe Pina::Models::SalesInvoice do
  describe 'to_s' do
    it 'returns usable name' do
      expect(Pina::Models::SalesInvoice.to_s).to eq 'sales_invoice'
    end
  end
end
