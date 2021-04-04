# frozen_string_literal: true
require 'csv'

module CsvSerializer
  module Method
    extend ActiveSupport::Concern

    class_methods do
      def to_csv(*columns, **definitions)
        if definitions.present?
          from_functions definitions
        else
          from_columns columns
        end
      end

      def from_functions(functions)
        generate_csv(functions.keys, functions) do |row|
          functions.values.map do |function|
            function.call row
          end
        end
      end

      def from_columns(columns)
        columns = columns.presence || attribute_names
        generate_csv(columns, columns) do
          (_1.is_a?(Array) ? _1 : [_1])
        end
      end

      def generate_csv(header, columns_or_functions)
        CSV.generate do |csv|
          csv << header
          data_source(columns_or_functions).each do |row|
            csv << yield(row)
          end
        end
      end

      def data_source(functions_or_columns)
        if functions_or_columns.is_a?(Array)
          all.pluck(*functions_or_columns)
        else
          all
        end
      end
    end
  end
end
