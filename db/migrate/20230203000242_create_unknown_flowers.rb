class CreateUnknownFlowers < ActiveRecord::Migration[7.0]
  def change
    create_table :unknown_flowers do |t|
      t.string :feature
      t.integer :reception, null: false, defaults: 0

      t.timestamps
    end
  end
end
