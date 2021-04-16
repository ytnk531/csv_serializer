# frozen_string_literal: true

require 'csv'

module CsvSerializer
  module Method
    extend ActiveSupport::Concern

    class_methods do
      def to_csv(*columns, **definitions)
        serializer = Serializer.build(self, columns, definitions)
        serializer.serialize
      end
    end
  end
end
