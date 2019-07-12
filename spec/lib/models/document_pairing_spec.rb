require 'spec_helper'

describe Pina::Models::DocumentPairing do
  describe '#document_pairable' do
    context 'when pina document type exists' do
      it 'return purchase invoice' do
        pairing = described_class.new(document_pairable_type: 'purchase_invoice',
                                      document_pairable: { invoice_id: 2_017_001, gid: 1 })

        expect(pairing.document_pairable).to be_a(Pina::Models::PurchaseInvoice)
      end

      it 'return sales invoice' do
        pairing = described_class.new(document_pairable_type: 'sales_invoice',
                                      document_pairable: { invoice_id: 2_017_001, gid: 1 })

        expect(pairing.document_pairable).to be_a(Pina::Models::SalesInvoice)
      end

      it 'returns petty cash disburtment' do
        pairing = described_class.new(document_pairable_type: 'petty_cash_disburstment',
                                      document_pairable: { number: 2_017_001, gid: 1 })

        expect(pairing.document_pairable).to be_a(Pina::Models::PettyCashDisburstment)
      end
    end

    context 'when pina document type does not exist' do
      it 'returns document_pairable as hash' do
        pairing = described_class.new(document_pairable_type: 'petty_cash_income',
                                      document_pairable: { number: 2_017_001, gid: 1 })

        expect(pairing.document_pairable).to be_a(Hash)
      end
    end
  end
end
