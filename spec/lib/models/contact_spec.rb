require 'spec_helper'

describe Pina::Models::Contact do
  describe 'to_s' do
    it 'returns usable name' do
      expect(Pina::Models::Contact.to_s).to eq 'contact'
    end
  end
end
