class Response < ApplicationRecord
  belongs_to :answer_choice
  belongs_to :respondent, foreign_key: :user_id, class_name: "User"
end
