class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :name
    	t.integer :zip_code
    	t.integer :radius
    	t.integer :max_spending
    	t.boolean :notifications
    	
      t.timestamps
    end
  end
end
