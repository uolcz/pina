require 'spec_helper'

RSpec.describe Pina::Contact do
  let(:contact)  { Pina::Models::Contact.new(name: 'test') }
  let(:response) { Pina::RestAdapter::Response.new(404, '') }

  before do
    Pina.configure do |config|
      config.email     = 'test@test.com'
      config.tenant    = 'test'
      config.api_token = '123456'
    end

    stub_request(:get, "https://test.ucetnictvi.bonobo.cz/api/v1/contacts/existing").
      with(:headers => {'Authorization'=>'Basic dGVzdEB0ZXN0LmNvbToxMjM0NTY='}).
      to_return(:status => 200, body: body)

    stub_request(:get, "https://test.ucetnictvi.bonobo.cz/api/v1/contacts/imaginary").
      with(:headers => {'Authorization'=>'Basic dGVzdEB0ZXN0LmNvbToxMjM0NTY='}).
      to_return(:status => 404, body: errors)
  end

  describe 'find' do
    context 'valid id' do
      it 'returns contact object' do
        expect(Pina::Contact.find('existing')).to be_a Pina::Models::Contact
      end
    end

    context 'invalid id' do
      it 'returns response object' do
        expect(Pina::Contact.find('imaginary')).to be_a Pina::RestAdapter::Response
      end
    end
  end
end
