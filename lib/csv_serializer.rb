require 'csv_serializer/version'
require 'csv_serializer/railtie'
require 'csv_serializer/methods'
require 'csv_serializer/serializer'
require 'csv_serializer/serializer/function_serializer'
require 'csv_serializer/serializer/pluck_serializer'
require 'csv_serializer/definitions'
require 'csv_serializer/definitions/function_array'
require 'csv_serializer/definitions/symbol_array'
require 'csv_serializer/definitions/function_hash'

module CsvSerializer
  # Your code goes here...
end

ActiveSupport.on_load(:active_record) do
  include CsvSerializer::Method
end
