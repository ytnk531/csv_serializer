# frozen_string_literal: true

module CsvSerializer
  class Serializer
    attr_reader :definitions, :records

    def initialize(definitions)
      @definitions = definitions
    end

    def serialize
      generate_csv
    end

    def generate_csv
      header = definitions.header
      CSV.generate do |csv|
        csv << header
        definitions.target_records.each do |record|
          csv << definitions.process(record)
        end
      end
    end
  end
end
