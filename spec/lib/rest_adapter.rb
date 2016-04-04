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
