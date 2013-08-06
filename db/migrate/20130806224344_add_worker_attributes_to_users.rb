class AddWorkerAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_worker, :boolean
  end
end
