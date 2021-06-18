class RemoveTitleContentUserEmailToGists < ActiveRecord::Migration[5.2]
  def change
    remove_column :gists, :content
    remove_column :gists, :title
    remove_column :gists, :user_email
  end
end
