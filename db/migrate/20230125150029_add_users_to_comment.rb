# frozen_string_literal: true

# add users
class AddUsersToComment < ActiveRecord::Migration[7.0]
  def change
    add_references :comments, :author, null: false, foreign_key: { to_table: 'users' }
  end
end
