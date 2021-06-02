class AddUserTestColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tests, :string
  end
end
