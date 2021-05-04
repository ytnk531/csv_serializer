module CsvSerializer
  class Definition
    attr_reader :records

    def self.build(array, hash, records)
      if array.blank? && hash.blank?
        AllColumn.new(records)
      elsif array.blank?
        FunctionHash.new(records, hash)
      elsif array.all?(Symbol)
        SymbolArray.new(records, array)
      else
        FunctionArray.new(records, array)
      end
    end

    def initialize(records, array_or_hash = nil)
      @records = records
      @array_or_hash = array_or_hash
    end

    def definitions
      @array_or_hash
    end

    def serializer
      Serializer.new(self)
    end

    def target_records
      records.all
    end

    def header
      column_names.map { records.human_attribute_name(_1) }
    end
  end
end
