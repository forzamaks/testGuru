class AddUserIdToTests < ActiveRecord::Migration[5.2]
  def change
    change_table :tests do |t|
    
      t.references :user, null: false, foreign_key: true
    end

  end
end
