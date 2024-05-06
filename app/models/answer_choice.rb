class AnswerChoice < ApplicationRecord
  validates :question_id, :text, presence: true

  belongs_to :question
  has_many :responses
  has_one :question_poll_owner, through: :question, source: :owner
end
