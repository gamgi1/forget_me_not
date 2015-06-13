class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :female
      t.boolean :required
      t.boolean :days_specific

      t.timestamps null: false
    end
  end
end
