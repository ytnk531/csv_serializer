# frozen_string_literal: true

require 'csv'

module CsvSerializer
  module Method
    extend ActiveSupport::Concern

    class_methods do
      def to_csv(*array, **hash)
        serializer = Definitions.build(array, hash).serializer(self)
        serializer.serialize
      end
    end
  end
end
