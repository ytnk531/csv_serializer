module CsvSerializer
  class Definition
    class AllColumn < CsvSerializer::Definition
      def column_names
        records.attribute_names
      end

      def target_records
        records.pluck(*column_names)
      end

      def producers
        definitions.map(&:last)
      end

      def process(record)
        record
      end
    end
  end
end
