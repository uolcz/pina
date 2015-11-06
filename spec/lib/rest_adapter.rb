require 'spec_helper'

RSpec.describe Pina::RestAdapter do
  let(:payload) { Pina::Models::Contact.new(name: 'bla') }

  before do
    Pina.configure do |config|
      config.email     = 'test@test.com'
      config.tenant    = 'test'
      config.api_token = '123456'
    end

    stub_request(:get, "https://test.ucetnictvi.bonobo.cz/api/v1/contacts/").
      with(:headers => {'Authorization'=>'Basic dGVzdEB0ZXN0LmNvbToxMjM0NTY='}).
      to_return(:status => 200)
  end

  describe 'get' do
    it 'raises ConfigurationNotSet exception' do
      Pina.configuration = nil
      expect { Pina::RestAdapter.get(:contacts) }.to raise_exception Pina::ConfigurationNotSet
    end

    it 'returns response object' do
      expect(Pina::RestAdapter.get(:contacts)).to be_a Pina::RestAdapter::Response
    end

    it 'response has ok? set to true' do
      response = Pina::RestAdapter.get(:contacts)
      expect(response.ok?).to eq true
    end
  end

  describe 'post' do
    it 'raises ConfigurationNotSet exception' do
      Pina.configuration = nil
      expect { Pina::RestAdapter.post(:contacts, payload) }.to raise_exception Pina::ConfigurationNotSet
    end

    it 'returns response object' do
      expect(Pina::RestAdapter.post(:contacts, payload)).to be_a Pina::RestAdapter::Response
    end

    it 'response has ok? set to true' do
      response = Pina::RestAdapter.post(:contacts, payload)
      expect(response.ok?).to eq true
    end
  end

  describe 'patch' do

  end
end
