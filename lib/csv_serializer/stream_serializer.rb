require 'objspace'

module CsvSerializer
  class StreamSerializer < CsvSerializer::Serializer
    def serialize
      generate_csv(definitions.column_names, definitions) do |record|
        definitions.producers.map do |producer|
          producer.call record
        end
      end
    end

    def generate_csv(header, columns_or_functions)
      GC.start
      header = header.dup.map { records.human_attribute_name(_1) }
      io = Tempfile.new
      pp "gc:#{ObjectSpace.memsize_of_all}"
      CSV(io) do |csv|
        csv << header
        data_source(columns_or_functions).each do |row|
          csv << yield(row)
        end
      end
    end

    def data_source(_columns_or_functions)
      @records.all
    end
  end
end
