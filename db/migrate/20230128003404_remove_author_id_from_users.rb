class RemoveAuthorIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :author_id, :integer
  end
end
