# frozen_string_literal: true

require 'csv_serializer/serializer'

module CsvSerializer
  class Serializer
    class FunctionSerializer < CsvSerializer::Serializer
      def serialize
        generate_csv(definitions.column_names, definitions)
      end

      def target_records(_columns_or_functions)
        @records.all
      end
    end
  end
end
