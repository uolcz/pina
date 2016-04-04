$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pina'
require 'typhoeus'
require 'vcr'
require 'factory_girl'
require 'dotenv'
Dotenv.load

require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'factories/contact'
require 'factories/sales_invoice'
require 'factories/sales_item'

require 'support/shared_examples/resource'

RSpec.configure do |_config|
  include FactoryGirl::Syntax::Methods
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :typhoeus
  config.default_cassette_options = { record: :once }
  config.before_record { |i| i.response.body.force_encoding 'UTF-8' }
end

RSpec.configure do |config|
  config.before do
    Pina.configure do |config|
      config.base_url = 'http://localhost:3339/api/v1/'
    end
  end
end
