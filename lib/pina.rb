require 'active_support'
require 'base64'
require 'virtus'
require 'net/http'
require 'uri'

require 'pina/utils/pagination'

require 'pina/collections/base'

require 'pina/contact'
require 'pina/sales_invoice'
require 'pina/version'
require 'pina/rest_adapter'
require 'pina/sales_order'
require 'pina/receivable'
require 'pina/processed_document'
require 'pina/my_bank_account'
require 'pina/uploaded_document'

module Pina
  class ConfigurationNotSet < StandardError; end
  class ConnectionError < StandardError; end

  DEFAULT_API_VERSION = :v1
  DEFAULT_EMAIL       = 'dummy@email.com'
  DEFAULT_TENANT      = 'imaginary'

  SCHEME              = 'https://'
  API_PATH            = '.ucetnictvi.uol.cz/api/'

  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      self.configuration.set_defaults
      yield(configuration)
    end
  end

  class Configuration
    attr_accessor :api_token, :email, :tenant
    attr_reader :api_version

    def initialize
      set_defaults
    end

    def set_defaults
      @api_version = DEFAULT_API_VERSION
      @email       = DEFAULT_EMAIL
      @tenant      = DEFAULT_TENANT
      @base_url    = nil
    end

    def base_url=(base_url)
      @base_url = base_url
    end

    def base_url
      @base_url = SCHEME + tenant + API_PATH + "#{api_version}/"
    end
  end
end
