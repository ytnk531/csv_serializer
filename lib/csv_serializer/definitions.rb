module CsvSerializer
  class Definitions
    def self.build(array, hash)
      return SymbolArray.new([]) if array.blank? && hash.blank?
      return FunctionHash.new(hash) if array.blank?

      if array.blank? || array.all?(Symbol)
        SymbolArray.new(array)
      else
        FunctionArray.new(array)
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
