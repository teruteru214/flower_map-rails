class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :unknown_flower, null: false, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
