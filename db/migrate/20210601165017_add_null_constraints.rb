class AddNullConstraints < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:users, :name, false)
    change_column_null(:users, :email, false)
    change_column_null(:answers, :title, false)
    change_column_null(:categories, :title, false)
    change_column_null(:tests, :title, false)
    change_column_null(:questions, :body, false)
  end
end
