class AddIndexToPollsAuthor < ActiveRecord::Migration[7.1]
  def change
    add_index :polls, :author_id
  end
end
