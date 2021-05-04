# frozen_string_literal: true
require "csv"

module CsvSerializer
  # Provides functions to generate csv string and file from column definition object.
  class Serializer
    attr_reader :definitions, :records

    def initialize(definitions)
      @definitions = definitions
    end

    def serialize
      CSV.generate do |csv|
        csv << definitions.header
        definitions.target_records.each do |record|
          csv << definitions.process(record)
        end
      end
    end

    def serialize_to(io)
      io << CSV.generate_line(definitions.header)
      definitions.target_records.each do |record|
        io << CSV.generate_line(definitions.process(record))
      end
    end

  end
end
