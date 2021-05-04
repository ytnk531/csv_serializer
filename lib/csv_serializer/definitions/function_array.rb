module CsvSerializer
  class Definitions::FunctionArray < CsvSerializer::Definitions
    def column_names
      definitions.map(&:first)
    end

    def process(record)
      producers.map do |func|
        func.call record
      end
    end

    def producers
      definitions.map(&:last)
    end
  end
end
