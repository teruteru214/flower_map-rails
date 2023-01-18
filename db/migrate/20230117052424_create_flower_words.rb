class CreateFlowerWords < ActiveRecord::Migration[7.0]
  def change
    create_table :flower_words do |t|
      t.string :name
      t.string :word

      t.timestamps
    end
  end
end
