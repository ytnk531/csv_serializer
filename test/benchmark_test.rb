require 'test_helper'
require "minitest/benchmark"

class BenchmarkTest < Minitest::Benchmark
  def self.bench_range
    [1, 10, 100, 1_000, 10_000, 100_000]
  end

  def bench_pluck
    now = Time.current
    Person.insert_all!(100000.times.map { { name: "sample", created_at: now, updated_at: now} })
    assert_performance_linear do |n|
      Person.limit(n).to_csv
    end
  end

  # def bench_array
  #   p = "111" * 1000000
  #   now = Time.current
  #   Person.insert_all!(100000.times.map { { name: "sample", created_at: now, updated_at: now} })
  #   assert_performance_linear do |n|
  #     Person.limit(n).to_csv(name: -> (_t) { p })
  #   end
  # end

  def bench_file
    p = ("111" * 1000000).freeze
    now = Time.current
    Person.insert_all!(100000.times.map { { name: "sample", created_at: now, updated_at: now} })
    assert_performance_linear do |n|
      Person.limit(n).to_csv_file(name: -> (_t) { p })
    end
  end
end