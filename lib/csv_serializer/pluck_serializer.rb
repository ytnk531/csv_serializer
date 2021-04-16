require 'csv_serializer/serializer'
class CsvSerializer::PluckSerializer < CsvSerializer::Serializer
  def serialize
    h = definitions.presence || records.attribute_names.map(&:to_sym)
    generate_csv(h, h) do
      (_1.is_a?(Array) ? _1 : [_1])
    end
  end
end
