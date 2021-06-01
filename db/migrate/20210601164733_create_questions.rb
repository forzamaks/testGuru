class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :body
      t.references :tests, null: false, foreign_key: true
      t.timestamps
    end
  end
end
