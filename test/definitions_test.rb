require "test_helper"

class DefinitionsTest < ActiveSupport::TestCase
  test "it builds concrete Definitions from definitions" do
    actual = CsvSerializer::Definitions.build(nil, {})
    assert_equal CsvSerializer::FunctionHashDefinitions, actual.class

    actual = CsvSerializer::Definitions.build([:name], {})
    assert_equal CsvSerializer::SymbolArrayDefinitions, actual.class

    actual = CsvSerializer::Definitions.build([["na", -> { _1.name }]], {})
    assert_equal CsvSerializer::FunctionArrayDefinitions, actual.class
  end
end
