class CreateUserBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :user_badges do |t|
      t.references :user, foreign_key: true
      t.references :badge, foreign_key: true
      t.references :test, foreign_key: true
    end
  end
end

