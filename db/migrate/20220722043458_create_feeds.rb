class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.integer :genre_id
      t.text :comment
      t.integer :user_id
      t.integer :song_id
      t.timestamps
    end
  end
end
