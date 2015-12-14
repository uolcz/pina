require 'spec_helper'

RSpec.describe Pina::RestAdapter do
  let(:payload) { Pina::Models::Contact.new(name: 'bla') }
  let(:id)      { 'imaginary' }

  before do
    Pina.configure do |config|
      config.email     = ENV['EMAIL']
      config.tenant    = ENV['TENANT']
      config.api_token = ENV['API_TOKEN']
    end
  end

  describe 'get' do
    it 'raises ConfigurationNotSet exception' do
      VCR.use_cassette 'get', record: :once do
        Pina.configuration = nil
        expect { Pina::RestAdapter.get(:contacts) }.to raise_exception Pina::ConfigurationNotSet
      end
    end

    it 'returns response object' do
      VCR.use_cassette 'get', record: :once do
        expect(Pina::RestAdapter.get(:contacts)).to be_a Pina::RestAdapter::Response
      end
    end
  end

  describe 'post' do
    it 'raises ConfigurationNotSet exception' do
      VCR.use_cassette 'post', record: :once do
        Pina.configuration = nil
        expect { Pina::RestAdapter.post(:contacts, payload) }.to raise_exception Pina::ConfigurationNotSet
      end
    end

    it 'returns response object' do
      VCR.use_cassette 'post', record: :once do
        expect(Pina::RestAdapter.post(:contacts, payload)).to be_a Pina::RestAdapter::Response
      end
    end
  end

  describe 'patch' do
    it 'raises ConfigurationNotSet exception' do
      VCR.use_cassette 'patch', record: :once do
        Pina.configuration = nil
        expect { Pina::RestAdapter.patch(:contacts, id, payload) }.to raise_exception Pina::ConfigurationNotSet
      end
    end

    it 'returns response object' do
      VCR.use_cassette 'patch', record: :once do
        expect(Pina::RestAdapter.patch(:contacts, id, payload)).to be_a Pina::RestAdapter::Response
      end
    end
  end
end
