require 'spec_helper'

RSpec.describe Pina::Contact do
  let(:contact)         { Pina::Models::Contact.new(name: 'test') }
  let(:invalid_contact) { Pina::Models::Contact.new(name: 'invalid') }
  let(:response)        { Pina::RestAdapter::Response.new(404, '') }
  let(:body)            { { name: 'bla' }.to_json }
  let(:errors)          { { message: 'validation failed' }.to_json }
  let(:id)              { 'existing' }
  let(:invalid_id)      { 'imaginary' }

  before do
    Pina.configure do |config|
      config.email     = 'test@test.com'
      config.tenant    = 'test'
      config.api_token = '123456'
    end

    stub_request(:get, "https://test.ucetnictvi.bonobo.cz/api/v1/contacts/existing").
      with(:headers => {'Authorization'=>'Basic dGVzdEB0ZXN0LmNvbToxMjM0NTY='}).
      to_return(:status => 200, body: body)

    stub_request(:get, "https://test.ucetnictvi.bonobo.cz/api/v1/contacts/").
      with(:headers => {'Authorization'=>'Basic dGVzdEB0ZXN0LmNvbToxMjM0NTY='}).
      to_return(:status => 200, body: body)

    stub_request(:get, "https://test.ucetnictvi.bonobo.cz/api/v1/contacts/imaginary").
      with(:headers => {'Authorization'=>'Basic dGVzdEB0ZXN0LmNvbToxMjM0NTY='}).
      to_return(:status => 404, body: errors)

    stub_request(:post, "https://test.ucetnictvi.bonobo.cz/api/v1/contacts/").
      with(:body => "business_entity=&country_id=&email=&name=test&note=&phone=&specific_symbol=&url=&vatin=",
           :headers => {'Authorization'=>'Basic dGVzdEB0ZXN0LmNvbToxMjM0NTY='}).
      to_return(:status => 201, :body => contact.attributes.to_json)

    stub_request(:post, "https://test.ucetnictvi.bonobo.cz/api/v1/contacts/").
      with(:body => "business_entity=&country_id=&email=&name=invalid&note=&phone=&specific_symbol=&url=&vatin=",
           :headers => {'Authorization'=>'Basic dGVzdEB0ZXN0LmNvbToxMjM0NTY='}).
      to_return(:status => 422, :body => errors)

    stub_request(:patch, "https://test.ucetnictvi.bonobo.cz/api/v1/contacts/existing").
      with(:body => "business_entity=&country_id=&email=&name=test&note=&phone=&specific_symbol=&url=&vatin=",
           :headers => {'Authorization'=>'Basic dGVzdEB0ZXN0LmNvbToxMjM0NTY='}).
      to_return(:status => 200, :body => contact.attributes.to_json)

    stub_request(:patch, "https://test.ucetnictvi.bonobo.cz/api/v1/contacts/imaginary").
      with(:body => "business_entity=&country_id=&email=&name=invalid&note=&phone=&specific_symbol=&url=&vatin=",
           :headers => {'Authorization'=>'Basic dGVzdEB0ZXN0LmNvbToxMjM0NTY='}).
      to_return(:status => 422, :body => errors)
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

  describe 'all' do
    it 'returns all contacts' do
      expect(Pina::Contact.all).to be_a Pina::Models::ContactList
    end
  end

  describe 'create' do
    context 'valid contact' do
      it 'returns contact object' do
        expect(Pina::Contact.create(contact)).to be_a Pina::Models::Contact
      end
    end

    context 'invalid contact' do
      it 'returns response object' do
        expect(Pina::Contact.create(invalid_contact)).to be_a Pina::RestAdapter::Response
      end
    end
  end

  describe 'update' do
    context 'valid contact' do
      it 'returns contact object' do
        expect(Pina::Contact.update(id, contact)).to be_a Pina::Models::Contact
      end
    end

    context 'invalid contact' do
      it 'returns response object' do
        expect(Pina::Contact.update(invalid_id, invalid_contact)).to be_a Pina::RestAdapter::Response
      end
    end
  end
end
