class CsvSerializer::SymbolArrayDefinitions < CsvSerializer::Definitions
  def column_names
    definitions
  end

  def producers
    definitions
  end

  def none?
    definitions.blank?
  end
end
