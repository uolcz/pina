module Pina
  module Utils
    module Pagination
      def next_page
        resource.all(extract_next_page)
      end

      def first_page
        resource.all
      end

      def previous_page
        resource.all(extract_prev_page)
      end

      private

      def resource
        Object.const_get("Pina::#{self.class.to_s.split('::').last}")
      end

      def extract_next_page
        string = _meta['pagination']['next']
        return unless string

        index = string.index('?')
        string[index..-1]
      end

      def extract_prev_page
        string = _meta['pagination']['prev']
        return unless string

        index = string.index('?')
        string[index..-1]
      end
    end
  end
end
