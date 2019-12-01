class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.boolean :checked
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
