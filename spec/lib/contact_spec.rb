require 'spec_helper'

RSpec.describe Pina::Contact do
  let(:valid_id)           { 'testovaci' }
  let(:invalid_id)         { 'imaginary' }
  let(:resource)           { FactoryGirl.build(:contact) }
  let(:invalid_resource)   { Pina::Models::Contact.new(vatin: 'arbitrary') }
  let(:different_resource) { FactoryGirl.build(:contact_diff_vatin) }

  it_behaves_like 'resource'

  describe 'all' do
    it 'returns all contacts' do
      VCR.use_cassette 'contact_all' do
        expect(Pina::Contact.all).to be_a Pina::Models::ContactList
      end
    end

    describe '#find_by' do
      it 'searches contacts by vatin' do
        VCR.use_cassette 'contact_find_by_vatin' do
          contact = Pina::Contact.find_by(vatin: 'CZ27169278')

          expect(contact.name).to eq 'Účetnictví on-line, s.r.o.'
        end
      end

      it 'searches contacts by ico' do
        VCR.use_cassette 'contact_find_by_ico' do
          contact = Pina::Contact.find_by(ico: '27169278')

          expect(contact.name).to eq 'Účetnictví on-line, s.r.o.'
        end
      end
    end
  end
end
