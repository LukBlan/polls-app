class CreateQuestion < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.integer :poll_id
      t.string :text
    end
  end
end
