require "csv_serializer/version"
require "csv_serializer/railtie"
require "csv_serializer/methods"
require "csv_serializer/serializer"

module CsvSerializer
  # Your code goes here...
end

ActiveSupport.on_load(:active_record) do
  include CsvSerializer::Method
end
