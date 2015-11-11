require 'pry'
require 'virtus'
require 'typhoeus'

require 'pina/contact'
require 'pina/version'
require 'pina/rest_adapter'

require 'pina/models/address'
require 'pina/models/contact'
require 'pina/models/contact_list'


module Pina
  class ConfigurationNotSet < StandardError; end

  DEFAULT_API_VERSION = :v1
  DEFAULT_EMAIL       = 'dummy@email.com'
  DEFAULT_TENANT      = 'imaginary'

  SCHEME              = 'https://'
  API_PATH            = '.ucetnictvi.bonobo.cz/api/'

  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end

  class Configuration
    attr_accessor :api_token, :email, :tenant
    attr_reader   :api_version

    def initialize
      @api_version = DEFAULT_API_VERSION
      @email       = DEFAULT_EMAIL
      @tenant      = DEFAULT_TENANT
    end

    def base_url
      SCHEME + tenant + API_PATH + "#{api_version}/"
      # HACK: to use gem at localhost setting
      #'http://hronek-fantozzi-dev.localhost:3000/api/v1/'
    end
  end
end
