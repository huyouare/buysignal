class EditResultFields < ActiveRecord::Migration
  def change
  	add_column :results, :id_str, :string
  	add_column :results, :html, :text
  end
end
