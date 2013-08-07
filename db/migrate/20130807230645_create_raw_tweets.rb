class CreateRawTweets < ActiveRecord::Migration
  def change
    create_table :raw_tweets do |t|
      t.text :json
      t.string :text
    
      t.timestamps
    end
  end
end
