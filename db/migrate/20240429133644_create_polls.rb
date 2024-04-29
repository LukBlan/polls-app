class CreatePolls < ActiveRecord::Migration[7.1]
  def change
    create_table :polls do |t|
      t.integer :author_id, null: false
      t.string :title, null: false
    end
  end
end
