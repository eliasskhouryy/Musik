class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :email
      t.text :name
      t.string :image
      t.string :password_digest
      t.integer :feed_id
      t.timestamps
    end
  end
end
