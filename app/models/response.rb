class Response < ApplicationRecord
  validate :not_duplicated_response, :not_owned_pool

  belongs_to :answer_choice
  belongs_to :respondent, foreign_key: :user_id, class_name: "User"

  has_one :question, through: :answer_choice, source: :question
  has_one :poll, through: :answer_choice, source: :poll

  def not_duplicated_response
    errors.add(:answer_choice_id, "User can't have duplicate responses") if duplicate_response?
  end

  def duplicate_response?
    self.question.responses.where(user_id: self.user_id).count >= 1
  end

  def not_owned_pool
    errors.add(:answer_choice, "User can't response a question from owned pool") if owned_pool?
  end

  def owned_pool?
    owner_id = AnswerChoice.joins(question: :owner)
                       .where(id: self.answer_choice_id).pluck(:author_id).first
    owner_id == self.user_id
  end
end


