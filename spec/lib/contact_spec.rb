require 'spec_helper'

RSpec.describe Pina::Contact do
  let(:valid_id)           { 'test' }
  let(:invalid_id)         { 'imaginary' }
  let(:contact)            { FactoryGirl.build(:contact) }
  let(:invalid_contact)    { Pina::Models::Contact.new }
  let(:contact_with_id)    { FactoryGirl.build(:contact, contact_id: 'test') }
  let(:contact_diff_vatin) { FactoryGirl.build(:contact_diff_vatin) }

  before do
    Pina.configure do |config|
      config.email     = ENV['EMAIL']
      config.tenant    = ENV['TENANT']
      config.api_token = ENV['API_TOKEN']
    end
  end

  describe 'new' do
    it 'initializes new contact' do
      expect(Pina::Contact.new).to be_a Pina::Models::Contact
    end
  end

  describe 'find' do
    context 'valid id' do
      it 'returns contact object' do
        VCR.use_cassette 'find' do
          expect(Pina::Contact.find(valid_id)).to be_a Pina::Models::Contact
        end
      end
    end

    context 'invalid id' do
      it 'returns response object' do
        VCR.use_cassette 'find_invalid' do
          expect(Pina::Contact.find(invalid_id))
            .to be_a Pina::RestAdapter::Response
        end
      end

      it 'returns 404 status code' do
        VCR.use_cassette 'find_invalid' do
          response = Pina::Contact.find(invalid_id)
          expect(response.status_code).to eq 404
        end
      end
    end
  end

  describe 'all' do
    it 'returns all contacts' do
      VCR.use_cassette 'all' do
        expect(Pina::Contact.all).to be_a Pina::Models::ContactList
      end
    end
  end

  describe 'create' do
    context 'valid contact' do
      it 'returns contact object' do
        VCR.use_cassette 'create' do
          expect(Pina::Contact.create(contact)).to be_a Pina::Models::Contact
        end
      end
    end

    context 'invalid contact' do
      it 'returns response object' do
        VCR.use_cassette 'create_invalid' do
          expect(Pina::Contact.create(invalid_contact))
            .to be_a Pina::RestAdapter::Response
        end
      end

      it 'returns 422 status code' do
        VCR.use_cassette 'create_invalid' do
          response = Pina::Contact.create(invalid_contact)
          expect(response.status_code).to eq 422
        end
      end
    end
  end

  describe 'update' do
    context 'valid contact' do
      it 'returns contact object' do
        VCR.use_cassette 'update' do
          expect(Pina::Contact.update(valid_id, contact_diff_vatin))
            .to be_a Pina::Models::Contact
        end
      end
    end

    context 'invalid contact' do
      it 'returns response object' do
        VCR.use_cassette 'update_invalid' do
          expect(Pina::Contact.update(valid_id, invalid_contact))
            .to be_a Pina::RestAdapter::Response
        end
      end

      it 'returns 422 status code' do
        VCR.use_cassette 'update_invalid' do
          response = Pina::Contact.update(valid_id, invalid_contact)
          expect(response.status_code).to eq 422
        end
      end
    end

    context 'non-existing contact' do
      it 'returns response object' do
        VCR.use_cassette 'update_nonexisting' do
          expect(Pina::Contact.update(invalid_id, contact))
            .to be_a Pina::RestAdapter::Response
        end
      end

      it 'returns 404 status code' do
        VCR.use_cassette 'update_nonexisting' do
          response = Pina::Contact.update(invalid_id, contact)
          expect(response.status_code).to eq 404
        end
      end
    end
  end
end
