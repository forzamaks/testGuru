class CreateTestPassages < ActiveRecord::Migration[5.2]
  def change
    create_table :test_passages do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true, on_delete: :cascade
      t.references :current_question, foreign_key: { to_table: :questions }, on_delete: :cascade
      t.integer :correct_questions, default: 0

      t.timestamps
    end
  end
end
