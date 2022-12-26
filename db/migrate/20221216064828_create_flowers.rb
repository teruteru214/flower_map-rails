class CreateFlowers < ActiveRecord::Migration[7.0]
  def change
    create_table :flowers do |t|
      t.string :name, null: false
      t.time :datetime, null: false
      t.integer :status, null: false, defalut: 0
      t.string :flower_word
      t.string :birth_flower_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
