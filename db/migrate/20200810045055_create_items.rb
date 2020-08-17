class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      # t.references :user, null: false, foreign_key: true
      t.integer :user_id,     null: false
      t.string :title,        null: false
      t.string :image,        null: false
      t.text :description,    null: false
      t.integer :category_id, null: false
      t.integer :state_id,    null: false
      t.integer :charge_id,   null: false
      t.integer :pref_id,     null: false
      t.integer :due_id,      null: false
      t.integer :price,       null: false
      t.integer :star,        null: false
      t.timestamps
    end
  end
end
