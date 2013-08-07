class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.string :keyword
      t.integer :cpl
      t.integer :query_id
    
      t.timestamps
    end
    add_index :filters, :query_id
  end
end
