require 'spec_helper'

RSpec.describe Pina::PettyCashIncome do
  describe '.all' do
    it 'returns petty cash incomes' do
      VCR.use_cassette 'petty_cash_income', match_requests_on: %i[method path] do
        expect(described_class.all).to be_a Pina::Collections::PettyCashIncome
      end
    end
  end

  describe '.find' do
    let(:petty_cash_income) { described_class.find(65_534) }

    it 'returns petty cash income' do
      VCR.use_cassette 'petty_cash_income_find', match_requests_on: %i[method path] do
        expect(petty_cash_income).to be_a Pina::Models::PettyCashIncome
      end
    end

    it 'returns petty cash income with correct gid' do
      VCR.use_cassette 'petty_cash_income_find', match_requests_on: %i[method path] do
        expect(petty_cash_income.gid).to eq 65_534
      end
    end
  end
end
