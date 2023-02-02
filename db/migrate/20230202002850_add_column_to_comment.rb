class AddColumnToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :evaluation, :integer, null: false, defalut: 2
  end
end
