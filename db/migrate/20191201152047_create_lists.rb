class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.string :master_secret, unique: true, null: false
      t.string :share_secret, unique: true, null: false

      t.timestamps
    end
  end
end
