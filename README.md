# CsvSerializer
Adds easy CSV generation functionality to `ActiveRecord`.

## Usage
Suppose Person model is defined.
```ruby
class Person < ApplicationRecord
  # In schema.rb, columns are defined as below definition.
  # create_table "people", force: :cascade do |t|
  #   t.string "name"
  #   t.integer "age"
  #   t.integer "tall"
  #   t.integer "weight"
  #   t.datetime "created_at", precision: 6, null: false
  #   t.datetime "updated_at", precision: 6, null: false
  # end
end
```

`to_csv` returns csv as string.

```ruby
Person.to_csv
# => id,name,age,tall,weight,created_at,updated_at
#    1,sample1,1,128,34,2020-01-01 10:02:39 UTC,2020-01-01 11:02:39 UTC
#    2,sample2,2,130,32,2020-01-01 12:02:39 UTC,2020-01-01 14:02:39 UTC
````

If attribute names is passed, CSV string only contains the specified attributes will be returned.
```ruby
Person.to_csv(:id, :name)
# => id,name
#    1,sample1
#    2,sample2
```

Containing the value gained by processing the record is supported.
```ruby
Person.to_csv(
  "long name": ->(user) { user.name * 2 },
  "short name": ->(user) { user.name[-2..] }
)
# => long name,short name
#    sample1sample1,e1
#    sample2sample2,e2
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'csv_serializer'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install csv_serializer
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
