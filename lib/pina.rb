require 'active_support'
require 'base64'
require 'virtus'
require 'net/http'
require 'uri'

require 'pina/utils/pagination'

require 'pina/models/errors'
require 'pina/models/error'
require 'pina/collections/base'
require 'pina/resource'

require 'pina/contact'
require 'pina/sales_invoice'
require 'pina/purchase_invoice'
require 'pina/version'
require 'pina/rest_adapter'
require 'pina/sales_order'
require 'pina/receivable'
require 'pina/processed_document'
require 'pina/petty_cash_disburstment'
require 'pina/petty_cash_income'
require 'pina/stat_processed_document'
require 'pina/my_bank_account'
require 'pina/uploaded_document'
require 'pina/uploaded_document_pairing'
require 'pina/document_pairing'

module Pina
  class ConfigurationNotSet < StandardError; end
  class ConnectionError < StandardError; end

  DEFAULT_API_VERSION = :v1
  DEFAULT_EMAIL       = 'dummy@email.com'.freeze
  DEFAULT_TENANT      = 'imaginary'.freeze

  API_HOST            = 'ucetnictvi.uol.cz'.freeze

  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      self.configuration.set_defaults
      yield(configuration)
    end
  end

  class Configuration
    attr_accessor :api_token, :email, :api_host, :use_ssl, :tenant, :default_per_page
    attr_reader :api_version
    attr_writer :base_url

    def initialize
      set_defaults
    end

    def set_defaults
      @api_version = DEFAULT_API_VERSION
      @email       = DEFAULT_EMAIL
      @tenant      = DEFAULT_TENANT
      @api_host    = API_HOST
      @default_per_page = nil
      @use_ssl     = true
      @base_url    = nil
    end

    def schema
      use_ssl ? 'https://' : 'http://'
    end

    def tenant_formatted
      @tenant.blank? ? '' : @tenant + '.'
    end

    def base_url
      @base_url = schema + tenant_formatted + api_host + '/api/' + "#{api_version}/"
    end
  end
end
