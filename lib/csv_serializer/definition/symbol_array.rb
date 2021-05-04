class CsvSerializer::Definition::SymbolArray < CsvSerializer::Definition
  def column_names
    definitions
  end

  def process(record)
    if definitions.size <= 1
      [record]
    else
      record
    end
  end

  def producers
    definitions
  end

  def target_records
    records.pluck(*column_names)
  end
end
