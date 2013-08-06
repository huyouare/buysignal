class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :keyword
      t.string :description
      t.timestamps
    end
  end
end
