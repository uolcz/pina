require 'spec_helper'

RSpec.describe Pina::RestAdapter::Response do
  describe '#initialize' do
    it "raises Pina::ConnectionError if status_code == 0 (server doesn't respond)" do
      expect { Pina::RestAdapter::Response.new(0, "") }
        .to raise_exception Pina::ConnectionError
    end
  end

  describe '#ok?' do
    it 'returns true if status_code == 200' do
      response = Pina::RestAdapter::Response.new(200, "")
      expect(response.ok?).to eq true
    end

    it 'returns true if status_code == 201' do
      response = Pina::RestAdapter::Response.new(201, "")
      expect(response.ok?).to eq true
    end
  end
end
