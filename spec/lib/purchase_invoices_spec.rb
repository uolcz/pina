require 'spec_helper'

describe Pina::PurchaseInvoice do
  let(:valid_id)           { 2_019_000_001 }
  let(:invalid_id)         { 9_999_999_999 }
  let(:resource)           { FactoryGirl.build(:purchase_invoice) }
  let(:invalid_resource)   { Pina::Models::PurchaseInvoice.new }
  let(:different_resource) { FactoryGirl.build(:purchase_invoice_diff) }

  it_behaves_like 'resource'

  describe 'all' do
    it 'returns all purchase invoices' do
      VCR.use_cassette 'purchase_invoice_all' do
        expect(Pina::PurchaseInvoice.all).to be_a Pina::Collections::PurchaseInvoice
      end
    end
  end
end
