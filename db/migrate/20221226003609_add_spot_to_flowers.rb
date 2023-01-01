class AddSpotToFlowers < ActiveRecord::Migration[7.0]
  def change
    add_column :flowers, :latitude, :float, null: false
    add_column :flowers, :longitude, :float, null: false
    add_column :flowers, :address, :string, null: false
  end
end
