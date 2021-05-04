module CsvSerializer
  class CsvSerializer::FunctionArray < CsvSerializer::Definitions
    def column_names
      definitions.map(&:first)
    end

    def producers
      definitions.map(&:last)
    end
  end
end