module Pina
  class RestAdapter
    include ActiveSupport::JSON

    class << self
      def get(resource, id_or_params = nil)
        net_http_for(:get, resource, id_or_params)
      end

      def post(resource, payload)
        net_http_for(:post, resource, nil, payload)
      end

      def patch(resource, id, payload)
        net_http_for(:patch, resource, id, payload)
      end

      def delete(resource, id = nil)
        net_http_for(:delete, resource, id)
      end

      private

      def net_http_for(method, resource, id, payload = nil)
        fail ConfigurationNotSet unless Pina.configuration

        uri = URI(url(resource, id))

        request = net_http_class_for(method).new(uri)
        headers.each do |k, v|
          request[k] = v
        end
        request.body = payload.to_json if payload

        response = Net::HTTP.start(uri.hostname, uri.port,
                                   use_ssl: true,
                                   verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
          http.request(request)
        end

        Response.new(response.code.to_i, response.body)
      end

      def net_http_class_for(method)
        Kernel.const_get("Net::HTTP::#{method.capitalize}")
      end

      def headers
        {
          'Authorization' => 'Basic ' + Base64
          .strict_encode64("#{Pina.configuration.email}:#{Pina.configuration.api_token}"),
          'Accept-Encoding' => 'application/json',
          'Content-Type' =>  'application/json'
        }
      end

      def url(resource, id_or_params)
        if id_or_params.is_a? Hash
          params = prepare_params_for_request(id_or_params)
          Pina.configuration.base_url + "#{resource}?#{params}"
        else
          Pina.configuration.base_url + "#{resource}/#{id_or_params}"
        end
      end

      def prepare_params_for_request(params)
        params.map { |key, value| "#{URI::escape(key.to_s)}=#{URI::escape(value.to_s)}" }.join('&')
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
        ActiveSupport::JSON.decode(body)
      end
    end
  end
end
