require 'memory_profiler'

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
      header = header.dup.map { records.human_attribute_name(_1) }
      io = File.open("file.txt", "w")
      io.write header.join
      data_source(columns_or_functions).in_batches do |rows|
        rows.each { io.write yield(_1).join }
      end
      io.close
    end

    def data_source(_columns_or_functions)
      @records.all
    end
  end
end
