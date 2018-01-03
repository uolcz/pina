require 'net/http/post/multipart'

module Pina
  class RestAdapter
    include ActiveSupport::JSON

    REQUEST_TIMEOUT     = 408
    SERVICE_UNAVAILABLE = 503

    class << self
      def get(resource, id_or_params = nil)
        net_http_for(:get, resource, id_or_params)
      end

      def post(resource, payload, multipart: false)
        net_http_for(:post, resource, nil, payload, multipart: multipart)
      end

      def patch(resource, id, payload)
        net_http_for(:patch, resource, id, payload, multipart: false)
      end

      def delete(resource, id = nil)
        net_http_for(:delete, resource, id)
      end

      private

      def net_http_for(method, resource, id, payload = nil, multipart: false)
        raise ConfigurationNotSet unless Pina.configuration

        uri = URI(url(resource, id))
        request = multipart ? multipart_request(uri, payload) : request(uri, method, payload)

        begin
          response = Net::HTTP.start(uri.hostname,
                                     uri.port,
                                     use_ssl: Pina.configuration.use_ssl) do |http|
            http.request(request)
          end
        rescue SocketError
          return Pina::Models::Error.new(status_code: SERVICE_UNAVAILABLE,
                                         message: "služba nedostupná - #{Pina.configuration.api_host}")
        rescue Net::ReadTimeout
          return Pina::Models::Error.new(status_code: REQUEST_TIMEOUT,
                                         message: "služba neodpovídá - #{Pina.configuration.api_host}")
        end

        Response.new(response.code.to_i, response.body)
      end

      def net_http_class_for(method)
        Kernel.const_get("Net::HTTP::#{method.capitalize}")
      end

      def auth_header
        {
          'Authorization' => 'Basic ' + Base64
                                        .strict_encode64("#{Pina.configuration.email}:#{Pina.configuration.api_token}")
        }
      end

      def headers
        auth_header.merge('Accept-Encoding' => 'application/json',
                          'Content-Type'    => 'application/json')
      end

      def request(uri, method, payload)
        request = net_http_class_for(method).new(uri)
        headers.each do |k, v|
          request[k] = v
        end
        request.body = payload.to_json if payload
        request
      end

      def multipart_request(uri, payload)
        request = Net::HTTP::Post::Multipart.new uri, multipart_payload(payload)
        auth_header.each do |k, v|
          request[k] = v
        end
        request
      end

      def multipart_payload(payload)
        return payload unless payload.is_a? Hash

        payload.map do |key, val|
          next unless val.respond_to?(:path)
          payload[key] = UploadIO.new(val, 'application/pdf', val.path.split('/').last)
        end

        payload
      end

      def url(resource, id_or_params)
        resource = resource_with_namespace(resource)

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

      def resource_with_namespace(*resource)
        resource.join('/')
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
