# frozen_string_literal: true

require 'csv'
require 'csv_serializer/function_serializer'
require 'csv_serializer/pluck_serializer'

module CsvSerializer
  module Method
    extend ActiveSupport::Concern

    class_methods do
      def to_csv(*columns, **definitions)
        serializer = if definitions.present?
                       FunctionSerializer.new(columns, definitions, self)
                     else
                       PluckSerializer.new(columns, self)
                     end
        serializer.serialize
      end
    end
  end
end
