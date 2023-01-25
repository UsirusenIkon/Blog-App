# frozen_string_literal: true

# AddUsersToLike
class AddUsersToLike < ActiveRecord::Migration[7.0]
  def change
    add_references :likes, :author, null: false, foreign_key: { to_table: 'users' }
  end
end
