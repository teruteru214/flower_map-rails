class CreateFlowers < ActiveRecord::Migration[7.0]
  def change
    create_table :flowers do |t|
      t.string :name, null: false
      t.date :date, null: false
      t.integer :status, null: false, defalut: 2


      t.timestamps
    end
  end
end
