module Pina
  module Utils
    module Pagination
      def next_page
        paginate(_meta['pagination']['next'])
      end

      def first_page
        resource.all
      end

      def previous_page
        paginate(_meta['pagination']['previous'])
      end

      def last_page
        paginate(_meta['pagination']['last'])
      end

      def paginate(page_url)
        params = extract_params(page_url)
        return unless params&.fetch('page')

        resource.all(params)
      end

      def collect_items
        resource = self

        [].tap do |collection|
          loop do
            collection.push(*resource.items)
            resource = resource.next_page

            break unless resource
          end
        end
      end

      private

      def resource
        Object.const_get("Pina::#{self.class.to_s.split('::').last}")
      end

      def extract_params(url)
        return unless url

        index = url.index('?')
        return unless index

        params_to_hash(url[index + 1..-1])
      end

      def params_to_hash(params)
        {}.tap do |params_hash|
          params.split('&').each do |element|
            param = element.split('=')
            params_hash[param.first] = param.last
          end
        end
      end
    end
  end
end
