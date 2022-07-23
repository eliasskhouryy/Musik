class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.text :title
      t.integer :bpm
      t.integer :user_id
      t.integer :feed_id
      t.timestamps
    end
  end
end
  