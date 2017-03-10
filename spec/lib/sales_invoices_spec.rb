require 'spec_helper'

describe Pina::SalesInvoice do
  let(:valid_id)           { 2_017_000_002 }
  let(:invalid_id)         { 9_999_999_999 }
  let(:resource)           { FactoryGirl.build(:sales_invoice) }
  let(:invalid_resource)   { Pina::Models::SalesInvoice.new }
  let(:different_resource) { FactoryGirl.build(:sales_invoice_diff) }

  it_behaves_like 'resource'

  describe 'all' do
    it 'returns all sales invoices' do
      VCR.use_cassette 'sales_invoice_all' do
        expect(Pina::SalesInvoice.all).to be_a Pina::Collections::SalesInvoice
      end
    end
  end
end
