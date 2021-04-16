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

      def from_columns(columns)
        if columns.blank? || columns.all?(Symbol)
          columns = columns.presence || attribute_names.map(&:to_sym)
          generate_csv(columns, columns) do
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

      def from_functions(functions)
        generate_csv(functions.keys, functions) do |row|
          functions.values.map do |function|
            function.call row
          end
        end
      end

      def generate_csv(header, columns_or_functions)
        header = header.dup.map { human_attribute_name(_1) }
        CSV.generate do |csv|
          csv << header
          data_source(columns_or_functions).each do |row|
            csv << yield(row)
          end
        end
      end

      def data_source(columns_or_functions)
        if columns_or_functions.is_a?(Array) && columns_or_functions.all?(Symbol)
          all.pluck(*columns_or_functions)
        else
          all
        end
      end
    end
  end
end
