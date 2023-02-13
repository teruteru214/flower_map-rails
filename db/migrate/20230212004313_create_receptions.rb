class CreateReceptions < ActiveRecord::Migration[7.0]
  def change
    create_table :receptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :unknown_flower, null: false, foreign_key: true

      t.timestamps
    end

    add_index :receptions, [:user_id, :unknown_flower_id], unique: true
  end
end
