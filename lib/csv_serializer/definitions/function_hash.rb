class CsvSerializer::Definitions::FunctionHash < CsvSerializer::Definitions
  def column_names
    definitions.keys
  end

  def process(record)
    producers.map do |func|
      func.call record
    end
  end

  def producers
    definitions.values
  end
end
