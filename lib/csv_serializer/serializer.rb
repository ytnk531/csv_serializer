# frozen_string_literal: true

module CsvSerializer
  class Serializer
    attr_reader :definitions, :records

    def self.build(records, definitions)
      if definitions.is_a?(SymbolArrayDefinitions)
        PluckSerializer.new(definitions, records)
      else
        FunctionSerializer.new(definitions, records)
      end
    end

    def initialize(definitions, records)
      @definitions = definitions
      @records = records
    end

    def generate_csv(header, columns_or_functions)
      header = header.dup.map { records.human_attribute_name(_1) }
      CSV.generate do |csv|
        csv << header
        data_source(columns_or_functions).each do |row|
          csv << yield(row)
        end
      end
    end
  end
end
