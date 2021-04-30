require 'test_helper'
require "minitest/benchmark"

class BenchmarkTest < Minitest::Benchmark
  def self.bench_range
    [10_000]
  end

  #def bench_pluck
  #  now = Time.current
  #  Person.insert_all!(100000.times.map { { name: "sample", created_at: now, updated_at: now} })
  #  assert_performance_linear do |n|
  #    Person.limit(n).to_csv
  #  end
  #end
  #

end