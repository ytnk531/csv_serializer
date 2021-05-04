class CsvSerializer::Definitions::SymbolArray < CsvSerializer::Definitions
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

  def none?
    definitions.blank?
  end
end
