require 'csv_serializer/serializer'
class CsvSerializer::FunctionSerializer < CsvSerializer::Serializer
  attr_reader :columns, :definitions, :records

  def initialize(columns, definitions, records)
    @columns = columns
    @definitions = definitions
    @records = records
  end

  def serialize
    generate_csv(definitions.keys, definitions) do |row|
      definitions.values.map do |function|
        function.call row
      end
    end
  end
end
