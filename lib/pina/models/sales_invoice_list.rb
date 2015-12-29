module Pina
  module Models
    class SalesInvoiceList
      include Virtus.model

      attribute :items, Array[SalesInvoice]
      attribute :_meta
      attribute :response

      def next_page
        Pina::SalesInvoice.all(extract_next_page)
      end

      def first_page
        Pina::SalesInvoice.all
      end

      def previous_page
        Pina::SalesInvoice.all(extract_prev_page)
      end

      private

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
