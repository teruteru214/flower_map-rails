class AddSpotToFlowers < ActiveRecord::Migration[7.0]
  def change
    add_column :flowers, :latitude, :float
    add_column :flowers, :longitude, :float
    add_column :flowers, :address, :string, null: false
    add_column :flowers, :address_detail, :string
  end
end
