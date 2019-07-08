require 'spec_helper'

RSpec.describe Pina::UploadedDocumentPairing do
  describe 'find' do
    it 'finds pairing by id' do
      VCR.use_cassette 'uploaded_document_pairing_find', match_requests_on: %i[method path] do
        expect(Pina::UploadedDocumentPairing.find(1)).to be_a Pina::Models::UploadedDocumentPairing
      end
    end
  end

  describe 'create' do
    it 'creates new uploaded document pairing' do
      VCR.use_cassette 'uploaded_document_pairing_create', match_requests_on: %i[method path] do
        response = Pina::UploadedDocumentPairing.create(uploaded_document_id: 1,
                                                        document_pairable_type: 'purchase_invoice',
                                                        document_pairable_id: '2017000004')
        expect(response.status_code).to eq 200
      end
    end
  end
end
