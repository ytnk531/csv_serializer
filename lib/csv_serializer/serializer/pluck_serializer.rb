require 'csv_serializer/serializer'
class CsvSerializer::PluckSerializer < CsvSerializer::Serializer
  def serialize
    column_names = if definitions.none?
                     records.attribute_names
                   else
                     definitions&.column_names
                   end
    generate_csv(column_names, column_names) do
      [_1].flatten
    end
  end

  def data_source(definitions)
    @records.all.pluck(*definitions)
  end
end
