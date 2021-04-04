require_relative "lib/csv_serializer/version"

Gem::Specification.new do |spec|
  spec.name        = "csv_serializer"
  spec.version     = CsvSerializer::VERSION
  spec.authors     = ["Yudai Tanaka"]
  spec.email       = ["ytnk531@gmail.com"]
  spec.homepage    = "https://ytana.work/"
  spec.summary     = "Summary of CsvSerializer."
  spec.description = "Description of CsvSerializer."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.1"
end
