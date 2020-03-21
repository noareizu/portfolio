class RemoveUserIdFromArticle < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :user_id, :string
  end
end
