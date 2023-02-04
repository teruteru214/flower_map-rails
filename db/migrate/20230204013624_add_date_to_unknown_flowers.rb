class AddDateToUnknownFlowers < ActiveRecord::Migration[7.0]
  def change
    add_column :unknown_flowers, :date, :date
  end
end
