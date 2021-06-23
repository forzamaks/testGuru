class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.string :badge_type, null: false
    end

  end
end
