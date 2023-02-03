class AddImageToUnknownFlowers < ActiveRecord::Migration[7.0]
  def change
    add_column :unknown_flowers, :image, :string, null: false
  end
end
