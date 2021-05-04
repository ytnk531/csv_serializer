# frozen_string_literal: true

require "test_helper"

class CsvSerializerTest < ActiveSupport::TestCase
  test "it builds concrete Serializer from definition" do
    actual = CsvSerializer::Serializer.build(
      Person.all,
      CsvSerializer::FunctionArrayDefinitions.new([])
    )
    assert_equal CsvSerializer::FunctionSerializer, actual.class

    actual = CsvSerializer::Serializer.build(
      Person.all,
      CsvSerializer::FunctionHashDefinitions.new([])
    )
    assert_equal CsvSerializer::FunctionSerializer, actual.class

    actual = CsvSerializer::Serializer.build(
      Person.all,
      CsvSerializer::SymbolArrayDefinitions.new([])
    )
    assert_equal CsvSerializer::PluckSerializer, actual.class
  end
end
