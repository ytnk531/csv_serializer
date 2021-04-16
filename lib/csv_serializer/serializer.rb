# frozen_string_literal: true

module CsvSerializer
  class Serializer
    def generate_csv(header, columns_or_functions)
      header = header.dup.map { records.human_attribute_name(_1) }
      CSV.generate do |csv|
        csv << header
        data_source(columns_or_functions).each do |row|
          csv << yield(row)
        end
      end
    end

    def data_source(columns_or_functions)
      if columns_or_functions.is_a?(Array) && columns_or_functions.all?(Symbol)
        @records.all.pluck(*columns_or_functions)
      else
        @records.all
      end
    end
  end
end
