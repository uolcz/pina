# frozen_string_literal: true

module Pina
  module Collections
    class Contact < Base
      attribute :items, Array[Pina::Models::Contact]
    end
  end
end
