class AddIndexUserQuestionToGists < ActiveRecord::Migration[5.2]
  def change
    change_table :gists do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
    end
  end
end
