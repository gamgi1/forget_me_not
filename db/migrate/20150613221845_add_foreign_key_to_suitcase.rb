class AddForeignKeyToSuitcase < ActiveRecord::Migration
  def change
    add_column :suitcases, :user_id, :integer
  end
end
