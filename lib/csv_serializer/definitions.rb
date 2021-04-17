module CsvSerializer
  class Definitions
    def self.build(array, hash)
      return SymbolArrayDefinitions.new([]) if array.blank? && hash.blank?
      return FunctionHashDefinitions.new(hash) if array.blank?

      if array.blank? || array.all?(Symbol)
        SymbolArrayDefinitions.new(array)
      else
        FunctionArrayDefinitions.new(array)
      end
    end

    def initialize(array_or_hash)
      @array_or_hash = array_or_hash
    end

    def definitions
      @array_or_hash
    end
  end
end
