class CsvSerializer::FunctionHashDefinitions < CsvSerializer::Definitions
  def column_names
    definitions.keys
  end

  def producers
    definitions.values
  end
end