class Question < ApplicationRecord
  has_many :answer_choices
  has_many :responses, through: :answer_choices, source: :responses

  belongs_to :poll
  has_one :owner, through: :poll, source: :author

  def result
    data = self.answer_choices
        .left_joins(:responses)
        .select("answer_choices.*, COUNT(responses.answer_choice_id) as choice_count")
        .group("answer_choices.id, answer_choices.text")
    answer_choice_count = {}

    data.each do |answer|
      answer_choice_count[answer.text] = answer.choice_count
    end

    answer_choice_count
  end
end
