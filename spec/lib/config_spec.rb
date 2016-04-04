require 'spec_helper'

RSpec.describe Pina do
  describe 'configuration' do
    context 'default' do
      before do
        Pina.configure do |config|
        end
      end

      it 'sets default api_version' do
        expect(Pina.configuration.api_version).to eq :v1
      end

      it 'sets default email' do
        expect(Pina.configuration.email).to eq 'dummy@email.com'
      end

      it 'sets default tenant' do
        expect(Pina.configuration.tenant).to eq 'imaginary'
      end
    end

    context 'manual config' do
      before do
        Pina.configure do |config|
          config.api_token   = '123'
          config.email       = 'me@here.com'
          config.tenant      = 'mine'
        end
      end

      it 'sets email' do
        expect(Pina.configuration.email).to eq 'me@here.com'
      end

      it 'sets tenant' do
        expect(Pina.configuration.tenant).to eq 'mine'
      end
    end

    describe '#endpoint' do
      before do
        Pina.configure do |config|
          config.api_token   = '123'
          config.email       = 'me@here.com'
          config.tenant      = 'mine'
        end
      end

      it 'returns base url' do
        expect(Pina.configuration.endpoint)
          .to eq 'https://mine.ucetnictvi.bonobo.cz/api/v1/'
      end
    end
  end
end
