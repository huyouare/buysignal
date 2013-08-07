class AddWorkerAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_worker, :boolean
    add_column :users, :is_admin, :boolean
  end
end
