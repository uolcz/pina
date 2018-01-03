require 'spec_helper'

RSpec.describe Pina::UploadedDocument do
  before :each do
    Pina.configure do |config|
      config.email = 'demo@ucetnictvi-on-line.cz'
      config.tenant = 'test'
      config.api_token = 'inZOJH2uLeaTCxU8aDm_7w'
    end
  end

  describe 'all' do
    it 'returns all uploaded documents' do
      VCR.use_cassette 'uploaded_document_all', match_requests_on: [:method, :path] do
        expect(Pina::UploadedDocument.all).to be_a Pina::Collections::UploadedDocument
      end
    end
  end

  describe '#find' do
    it 'returns uploaded document by id' do
      VCR.use_cassette 'uploaded_document_find_by_id', match_requests_on: [:method, :path] do
        document = Pina::UploadedDocument.find(1)

        expect(document.id).to eq 1
      end
    end
  end

  describe 'where' do
    it 'searches uploaded document by state' do
      VCR.use_cassette 'uploaded_document_where_state', match_requests_on: [:method, :path] do
        documents = Pina::UploadedDocument.where(state: 'processed')

        expect(documents).to respond_to :items
        expect(documents).to be_a Pina::Collections::UploadedDocument
      end
    end

    it 'returns nil if not found' do
      VCR.use_cassette 'uploaded_document_where_not_found', match_requests_on: [:method, :path] do
        documents = Pina::UploadedDocument.where(state: 'invalid_type')

        expect(documents).to respond_to :items
        expect(documents).to be_a Pina::Collections::UploadedDocument
        expect(documents.items.count.zero?).to be true
      end
    end
  end

  describe 'create' do
    let(:good_file) { File.open('spec/fixtures/document.pdf') }

    it 'uploads new document' do
      VCR.use_cassette 'uploaded_document_create', match_requests_on: [:method, :path] do
        document = Pina::UploadedDocument.create(file: good_file)

        expect(document).to be_a Pina::Models::UploadedDocument
      end
    end
  end
end
