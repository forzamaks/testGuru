class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.string :title
      t.string :content
      t.string :user_email
      t.string :gist_url
    end
  end
end
