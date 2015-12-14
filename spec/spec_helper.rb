$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pina'
require 'typhoeus'
require 'vcr'
require 'factory_girl'
require 'dotenv'
Dotenv.load

require 'factories/contact'

RSpec.configure do |_config|
  include FactoryGirl::Syntax::Methods
end

VCR.configure do |config|
  config.cassette_library_dir = 'fixtures/vcr_cassettes'
  config.hook_into :typhoeus
end
