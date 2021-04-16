require 'csv_serializer/serializer'
class CsvSerializer::PluckSerializer < CsvSerializer::Serializer
  attr_reader :columns, :records

  def initialize(columns, records)
    @columns = columns
    @records = records
  end

  def serialize
    if columns.blank? || columns.all?(Symbol)
      h = columns.presence || records.attribute_names.map(&:to_sym)
      generate_csv(h, h) do
        (_1.is_a?(Array) ? _1 : [_1])
      end
    else
      generate_csv(columns.map(&:first), columns) do |row|
        columns.map(&:last).map do |f|
          f.call row
        end
      end
    end
  end
end
