class AnswerChoice < ApplicationRecord
  belongs_to :question
  has_many :responses
end
