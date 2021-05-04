# frozen_string_literal: true

module CsvSerializer
  # Provides methods available on ActiveRecords.
  module Methods
    extend ActiveSupport::Concern

    class_methods do
      def to_csv(*array, **hash)
        serializer = Definition.build(array, hash, self).serializer
        serializer.serialize
      end

      def to_csv_stream(io, *array, **hash)
        serializer = Definition.build(array, hash, self).serializer
        Thread.new do
          serializer.serialize_to(io)
        end
      end
    end
  end
end
