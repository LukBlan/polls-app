class CreateAnswerChoices < ActiveRecord::Migration[7.1]
  def change
    create_table :answer_choices do |t|
      t.integer :question_id, null: false, index: true
      t.string :text, null: false
    end
  end
end
