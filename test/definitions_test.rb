require "test_helper"

class DefinitionsTest < ActiveSupport::TestCase
  test "it builds concrete Definitions from definition" do
    actual = CsvSerializer::Definition.build(nil, {})
    assert_equal CsvSerializer::FunctionHashDefinitions, actual.class

    actual = CsvSerializer::Definition.build([:name], {})
    assert_equal CsvSerializer::SymbolArrayDefinitions, actual.class

    actual = CsvSerializer::Definition.build([["na", -> { _1.name }]], {})
    assert_equal CsvSerializer::FunctionArrayDefinitions, actual.class
  end
end
