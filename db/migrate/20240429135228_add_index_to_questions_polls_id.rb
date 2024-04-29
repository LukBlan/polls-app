class AddIndexToQuestionsPollsId < ActiveRecord::Migration[7.1]
  def change
    add_index :questions, :poll_id
  end
end
