# frozen_string_literal: true

require 'test_helper'

class CsvSerializerTest < ActiveSupport::TestCase
  test 'it has a version number' do
    assert CsvSerializer::VERSION
  end

  test 'it outputs csv' do
    Person.create!(id: 1, name: 'sample1', tall: 128, weight: 34, created_at: '2020-1-1 10:02:39',
                   updated_at: '2020-1-1 11:02:39')
    Person.create!(id: 2, name: 'sample2', tall: 130, weight: 32, created_at: '2020-1-1 12:02:39',
                   updated_at: '2020-1-1 14:02:39')

    expected = <<~CSV
      Id,Name,Age,Tall,Weight,Created at,Updated at
      1,sample1,,128,34,2020-01-01 10:02:39 UTC,2020-01-01 11:02:39 UTC
      2,sample2,,130,32,2020-01-01 12:02:39 UTC,2020-01-01 14:02:39 UTC
    CSV
    assert_equal expected, Person.all.to_csv
  end

  test 'it outputs specified values' do
    Person.create!(id: 1, name: 'sample1')
    Person.create!(id: 2, name: 'sample2')

    expected = <<~CSV
      Name
      sample1
      sample2
    CSV
    assert_equal expected, Person.all.to_csv(:name)
  end

  test 'it outputs from lambda function' do
    Person.create!(id: 1, name: 'sample1')
    Person.create!(id: 2, name: 'sample2')

    expected = <<~CSV
      Long name
      sample1sample1
      sample2sample2
    CSV
    assert_equal expected, Person.all.to_csv("long name": ->(user) { user.name * 2 })

    expected = <<~CSV
      Long name,Short
      sample1sample1,e1
      sample2sample2,e2
    CSV
    assert_equal expected, Person.all.to_csv(
      "long name": ->(user) { user.name * 2 },
      "short": ->(user) { user.name[-2..] }
    )
  end

  test 'it translates column name' do
    Person.create!(id: 1, name: 'sample1')
    Person.create!(id: 2, name: 'sample2')

    I18n.backend.store_translations(:en, activerecord: { attributes: { person: { name: "Person's Name"} } })
    expected = <<~CSV
      Person's Name
      sample1
      sample2
    CSV
    assert_equal expected, Person.all.to_csv(:name)
  end

  test 'it outputs csv2' do
    Person.create
    Person.create

    expected = <<~CSV
      id, number
    CSV
    assert_equal Tempfile.new, Person.all.to_csv_file
  end
end
