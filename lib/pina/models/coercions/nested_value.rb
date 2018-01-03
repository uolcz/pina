module Pina
  module Models
    class NestedValue < Virtus::Attribute
      def coerce(value)
        value&.values&.join(', ')&.to_s
      end
    end
  end
end
