class CsvSerializer::Definition::FunctionHash < CsvSerializer::Definition
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
