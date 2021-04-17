# frozen_string_literal: true
require 'csv_serializer/serializer'

module CsvSerializer
  class FunctionSerializer < CsvSerializer::Serializer
    def serialize
      generate_csv(definitions.column_names, definitions) do |record|
        definitions.producers.map do |producer|
          producer.call record
        end
      end
    end

    def data_source(_columns_or_functions)
      @records.all
    end
  end
end
