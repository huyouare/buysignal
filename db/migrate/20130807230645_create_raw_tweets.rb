class CreateRawTweets < ActiveRecord::Migration
  def change
    create_table :raw_tweets do |t|
      t.text :json
      t.string :text
      # t.integer :created_at
      # t.boolean :geo
      # t.boolean :coordinates
      # t.integer :coordinate_x
      # t.integer :coordinate_y
      # t.string :twitter_id_str
      # t.lang :lang
      # t.boolean :retweeted 
      # t.string :user_name
      # t.string :user_profile_image_url

      t.timestamps
    end
  end
end
