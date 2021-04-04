class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :age
      t.integer :tall
      t.integer :weight

      t.timestamps
    end
  end
end
