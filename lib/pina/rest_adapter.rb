module Pina
  class RestAdapter
    class << self

      def get(resource, id = nil)
        raise ConfigurationNotSet unless Pina.configuration

        request = Typhoeus.get(url(resource, id), headers: auth)
        Response.new(request.response_code, request.body)
      end

      def post(resource, payload)
        raise ConfigurationNotSet unless Pina.configuration

        request = Typhoeus.post(url(resource, nil), headers: auth, body: payload.attributes)
        Response.new(request.response_code, request.body)
      end

      def patch(resource, id, payload)
        raise ConfigurationNotSet unless Pina.configuration

        request = Typhoeus.patch(url(resource, id), headers: auth, body: payload.attributes)
        Response.new(request.response_code, request.body)
      end

      private

      def auth
        { Authorization: 'Basic ' + Base64.
          strict_encode64("#{Pina.configuration.email}:#{Pina.configuration.api_token}") }
      end

      def url(resource, id)
        Pina.configuration.base_url + "#{resource}/#{id}"
      end
    end

    class Response
      attr_accessor :body, :status_code

      def initialize(status_code, body)
        @status_code = status_code
        @body        = body
      end

      def ok?
        status_code == 200 || status_code == 201
      end

      def to_hash
        JSON.parse(body)
      end
    end
  end
end
