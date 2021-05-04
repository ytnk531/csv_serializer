module CsvSerializer
  class Definitions
    class AllColumn < CsvSerializer::Definitions
      def column_names
        records.attribute_names
      end

      def process(record)
        record
      end

      def target_records
        records.pluck(*column_names)
      end

      def producers
        definitions.map(&:last)
      end
    end
  end
end
