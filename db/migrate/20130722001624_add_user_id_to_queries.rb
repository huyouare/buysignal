class AddUserIdToQueries < ActiveRecord::Migration
  def change
    add_column :queries, :user_id, :integer
    add_index :queries, :user_id
  end
end
