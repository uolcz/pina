require 'spec_helper'

RSpec.describe Pina::RestAdapter::Response do
  describe '#ok?' do
    it 'returns true if status_code == 200' do
      response = Pina::RestAdapter::Response.new('200', "")
      expect(response.ok?).to eq true
    end

    it 'returns true if status_code == 201' do
      response = Pina::RestAdapter::Response.new('201', "")
      expect(response.ok?).to eq true
    end
  end
end
