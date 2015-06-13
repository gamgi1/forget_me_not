class CreateSuitcases < ActiveRecord::Migration
  def change
    create_table :suitcases do |t|
      t.string :name
      t.integer :days
      t.string :gender

      t.timestamps null: false
    end
  end
end
