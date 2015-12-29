require 'spec_helper'

RSpec.describe Pina::Contact do
  let(:valid_id)           { 'testovaci' }
  let(:invalid_id)         { 'imaginary' }
  let(:resource)           { FactoryGirl.build(:contact) }
  let(:invalid_resource)   { Pina::Models::Contact.new(vatin: 'arbitrary') }
  let(:different_resource) { FactoryGirl.build(:contact_diff_vatin) }

  it_behaves_like 'resource'

  before do
    Pina.configure do |config|
      config.email     = ENV['EMAIL']
      config.tenant    = ENV['TENANT']
      config.api_token = ENV['API_TOKEN']
    end
  end

  describe 'all' do
    it 'returns all contacts' do
      VCR.use_cassette 'contact_all' do
        expect(Pina::Contact.all).to be_a Pina::Models::ContactList
      end
    end
  end
end
