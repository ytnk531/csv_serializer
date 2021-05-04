require "csv_serializer/version"
require "csv_serializer/railtie"
require "csv_serializer/methods"
require "csv_serializer/serializer"
require "csv_serializer/definition"
require "csv_serializer/definition/all_column"
require "csv_serializer/definition/function_array"
require "csv_serializer/definition/symbol_array"
require "csv_serializer/definition/function_hash"

module CsvSerializer
  # Your code goes here...
end

ActiveSupport.on_load(:active_record) do
  include CsvSerializer::Method
end
