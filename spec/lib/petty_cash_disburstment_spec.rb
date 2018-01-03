require 'spec_helper'

RSpec.describe Pina::PettyCashDisburstment do
  describe 'all' do
    it 'finds all petty cash disburstment' do
      VCR.use_cassette 'petty_cash_disburstment', match_requests_on: [:method, :path] do
        expect(Pina::PettyCashDisburstment.all).to be_a Pina::Collections::PettyCashDisburstment
      end
    end
  end
end
