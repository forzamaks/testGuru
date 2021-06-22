class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers, :question, null: false, foreign_key: true
    add_reference :questions, :test, null: false, foreign_key: true
    add_reference :tests, :category, null: false, foreign_key: true
    add_reference :tests, :user, null: false, foreign_key: true
  end
end
