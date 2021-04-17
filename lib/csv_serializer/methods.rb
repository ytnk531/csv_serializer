# frozen_string_literal: true

require 'csv'

module CsvSerializer
  module Method
    extend ActiveSupport::Concern

    class_methods do
      def to_csv(*array, **hash)
        definitions = Definitions.build(array, hash)
        serializer = Serializer.build(self, definitions)
        serializer.serialize
      end
    end
  end
end
