module Pina
  class RestAdapter
    class << self
      def get(resource, id_or_params = nil)
        fail ConfigurationNotSet unless Pina.configuration

        uri = URI(url(resource, id_or_params))

        request = Net::HTTP::Get.new(uri)
        headers(false).each do |k, v|
          request[k] = v
        end

        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
          http.request(request)
        end

        Response.new(response.code, response.body)
      end

      def post(resource, payload)
        fail ConfigurationNotSet unless Pina.configuration

        uri = URI(url(resource, nil))

        request = Net::HTTP::Post.new(uri)
        headers.each do |k, v|
          request[k] = v
        end
        request.set_form_data(payload.to_h)

        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
          http.request(request)
        end

        Response.new(response.code, response.body)
      end

      def patch(resource, id, payload)
        fail ConfigurationNotSet unless Pina.configuration

        uri = URI(url(resource, id))

        request = Net::HTTP::Patch.new(uri)
        headers.each do |k, v|
          request[k] = v
        end
        request.set_form_data(payload.to_h)

        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
          http.request(request)
        end

        Response.new(response.code, response.body)
      end

      def delete(resource, id = nil)
        fail ConfigurationNotSet unless Pina.configuration

        uri = URI(url(resource, id))

        request = Net::HTTP::Delete.new(uri)
        headers(false).each do |k, v|
          request[k] = v
        end

        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
          http.request(request)
        end

        Response.new(response.code, response.body)
      end

      private

      def headers(type = true)
        return auth.merge(content_type) if type
        auth
      end

      def content_type
        {
          'Accept-Encoding' => 'application/json',
          'Content-Type' =>  'application/json'
        }
      end

      def auth
        {
          'Authorization' => 'Basic ' + Base64
          .strict_encode64("#{Pina.configuration.email}:#{Pina.configuration.api_token}")
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
        status_code == '200' || status_code == '201'
      end

      def to_hash
        JSON.parse(body)
      end
    end
  end
end
