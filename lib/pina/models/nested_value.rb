module Pina
  module Models
    module Coercions
      class NestedValue < Virtus::Attribute
        def coerce(value)
          value.values.join(', ')
        end
      end
    end
  end
end