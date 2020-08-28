class CreateShips < ActiveRecord::Migration[6.0]
  def change
    create_table :ships do |t|
      t.references :buy,     null: false, foreign_key: true
      t.string     :postal,  null: false
      t.integer    :pref_id, null: false
      t.string     :city,    null: false
      t.string     :number,  null: false
      t.string     :house
      t.string     :tel,     null: false      
      t.timestamps
    end
  end
end
