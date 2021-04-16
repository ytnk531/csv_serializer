# frozen_string_literal: true
require 'csv_serializer/serializer'

module CsvSerializer
  class FunctionSerializer < CsvSerializer::Serializer
    def serialize
      generate_csv(definitions.keys, definitions) do |row|
        definitions.values.map do |function|
          function.call row
        end
      end
    end
  end
end
