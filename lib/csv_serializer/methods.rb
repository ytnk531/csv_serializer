# frozen_string_literal: true

module CsvSerializer
  module Method
    extend ActiveSupport::Concern

    class_methods do
      def to_csv(*columns)
        columns = columns.presence || attribute_names
        require 'csv'

        CSV.generate do |csv|
          header = columns
          csv << header
          all.pluck(*columns).each do
            csv << (_1.is_a?(Array) ? _1 : [_1])
          end
        end
      end
    end
  end
end
