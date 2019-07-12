require 'spec_helper'

describe Pina::DocumentPairing do
  describe 'all' do
    it 'returns all document pairings' do
      VCR.use_cassette 'document_pairing_all' do
        expect(described_class.all).to be_a Pina::Collections::DocumentPairing
      end
    end
  end
end
