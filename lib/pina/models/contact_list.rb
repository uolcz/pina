module Pina
  module Models
    class ContactList
      include Virtus.model

      attribute :items, Array[Contact]
      attribute :_meta

      def next_page
        Pina::Contact.all(extract_next_page)
      end

      def first_page
        Pina::Contact.all
      end

      def previous_page
        Pina::Contact.all(extract_prev_page)
      end

      private

      def extract_next_page
        string = _meta['pagination']['next']
        if string
          index = string.index('?')
          string[index..-1]
        else
          nil
        end
      end

      def extract_prev_page
        string = _meta['pagination']['prev']
        if string
          index = string.index('?')
          string[index..-1]
        else
          nil
        end
      end
    end
  end
end
