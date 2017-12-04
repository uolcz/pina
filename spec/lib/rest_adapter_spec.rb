require 'spec_helper'

RSpec.describe Pina::RestAdapter do
  let(:payload) { Pina::Models::Contact.new(name: 'bla') }
  let(:id)      { 'imaginary' }

  describe 'get' do
    it 'raises ConfigurationNotSet exception' do
      VCR.use_cassette 'get' do
        Pina.configuration = nil
        expect { Pina::RestAdapter.get(:contacts) }
          .to raise_exception Pina::ConfigurationNotSet
      end
    end

    it 'returns response object' do
      VCR.use_cassette 'get' do
        expect(Pina::RestAdapter.get(:contacts))
          .to be_a Pina::RestAdapter::Response
      end
    end
  end

  describe 'post' do
    it 'raises ConfigurationNotSet exception' do
      VCR.use_cassette 'post' do
        Pina.configuration = nil
        expect { Pina::RestAdapter.post(:contacts, payload) }
          .to raise_exception Pina::ConfigurationNotSet
      end
    end

    it 'returns response object' do
      VCR.use_cassette 'post' do
        expect(Pina::RestAdapter.post(:contacts, payload))
          .to be_a Pina::RestAdapter::Response
      end
    end
  end

  describe 'post multipart' do
    let(:file)                    { File.open('spec/fixtures/document.pdf') }
    let(:file_open)               { open('spec/fixtures/document.pdf') }
    let(:other_payload)           { { neco: 1 } }

    it 'converts File object to UploadIO object' do
      expect(UploadIO).to receive(:new)
        .with(file, 'application/pdf', file.path.split('/').last)
        .once

      VCR.use_cassette 'post_multipart', match_requests_on: [:method, :path] do
        Pina::RestAdapter.post(:uploaded_documents, { neco: file }, multipart: true)
      end
    end

    it 'does not instantiate UploadIO if there is no file in params' do
      expect(UploadIO).not_to receive(:new)

      VCR.use_cassette 'post_multipart_without_file', match_requests_on: [:method, :path] do
        Pina::RestAdapter.post(:uploaded_documents, other_payload, multipart: true)
      end
    end

    it 'works with open(file)' do
      VCR.use_cassette 'post_multipart', match_requests_on: [:method, :path] do
        expect(Pina::RestAdapter.post(:uploaded_documents, { file: file_open }, multipart: true))
          .to be_a Pina::RestAdapter::Response
      end
    end

    it 'works with File.open(file)' do
      VCR.use_cassette 'post_multipart', match_requests_on: [:method, :path] do
        expect(Pina::RestAdapter.post(:uploaded_documents, { file: file }, multipart: true))
          .to be_a Pina::RestAdapter::Response
      end
    end

    it 'accepts file as parameter without failure' do
      VCR.use_cassette 'post_multipart', match_requests_on: [:method, :path] do
        expect(Pina::RestAdapter.post(:uploaded_documents, file, multipart: true))
          .to be_a Pina::RestAdapter::Response
      end
    end
  end

  describe 'patch' do
    it 'raises ConfigurationNotSet exception' do
      VCR.use_cassette 'patch' do
        Pina.configuration = nil
        expect { Pina::RestAdapter.patch(:contacts, id, payload) }
          .to raise_exception Pina::ConfigurationNotSet
      end
    end

    it 'returns response object' do
      VCR.use_cassette 'patch' do
        expect(Pina::RestAdapter.patch(:contacts, id, payload))
          .to be_a Pina::RestAdapter::Response
      end
    end
  end
end
