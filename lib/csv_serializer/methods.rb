# frozen_string_literal: true

module CsvSerializer
  module Method
    extend ActiveSupport::Concern

    class_methods do
      def to_csv(*array, **hash)
        serializer = Definition.build(array, hash, self).serializer
        serializer.serialize
      end
    end
  end
end
