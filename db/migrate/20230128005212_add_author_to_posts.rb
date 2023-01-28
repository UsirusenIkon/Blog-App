class AddAuthorToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :Author, :string
    add_index :posts, :Author
  end
end
