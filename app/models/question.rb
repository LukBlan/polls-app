class Question < ApplicationRecord
  has_many :answer_choices
  has_many :responses, through: :answer_choices, source: :responses

  belongs_to :poll
  has_one :owner, through: :poll, source: :author
end
