class CreateResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :answer_choice_id, null: false
    end
  end
end
