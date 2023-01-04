class AddFlowerImageToFlowers < ActiveRecord::Migration[7.0]
  def change
    add_column :flowers, :flower_image, :string
  end
end
