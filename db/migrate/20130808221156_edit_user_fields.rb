class EditUserFields < ActiveRecord::Migration
  def change
  	add_column :users, :phone, :string
  	add_column :users, :mailing_address, :string
  end
end
