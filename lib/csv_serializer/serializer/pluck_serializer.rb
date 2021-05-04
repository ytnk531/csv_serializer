# frozen_string_literal: true

require 'csv_serializer/serializer'
module CsvSerializer
  class Serializer
    class PluckSerializer < CsvSerializer::Serializer
      def serialize
        generate_csv(column_names, column_names)
      end

      def target_records(definitions)
        @records.all.pluck(*definitions)
      end
    end
  end
end
