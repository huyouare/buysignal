class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :json
      t.integer :results
      t.integer :query_id

      t.timestamps
    end
    add_index :results, :query_id
  end
end
