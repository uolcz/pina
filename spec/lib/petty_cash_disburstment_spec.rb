require 'spec_helper'

RSpec.describe Pina::PettyCashDisburstment do
  describe 'all' do
    it 'finds all petty cash disburstment' do
      VCR.use_cassette 'petty_cash_disburstment_all', match_requests_on: %i[method path] do
        expect(described_class.all).to be_a Pina::Collections::PettyCashDisburstment
      end
    end
  end

  describe '.find' do
    let(:petty_cash_disburstment) { described_class.find(73_216) }

    it 'returns petty cash disburstment' do
      VCR.use_cassette 'petty_cash_disburstment_find', match_requests_on: %i[method path] do
        expect(petty_cash_disburstment).to be_a Pina::Models::PettyCashDisburstment
      end
    end

    it 'returns petty cash disburstment with correct gid' do
      VCR.use_cassette 'petty_cash_disburstment_find', match_requests_on: %i[method path] do
        expect(petty_cash_disburstment.gid).to eq 73_216
      end
    end
  end
end
