class CreateResults < ActiveRecord::Migration
  def change
    drop_table :results
    create_table :results do |t|
      t.text :json
      t.string :text
      t.integer :query_id
      t.boolean :is_buysignal
    
      t.timestamps
    end
    add_index :results, :query_id
  end
end
