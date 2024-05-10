class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :authored_polls, foreign_key: :author_id, class_name: "Poll"
  has_many :responses, foreign_key: :user_id, class_name: "Response"
  has_many :responded_polls, through: :responses, source: :poll

  def completed_polls
    self.responded_polls
        .select("polls.*, COUNT(questions.id)")
        .group("polls.id")
        .having("COUNT(questions.id) = (:sub_query)",
                sub_query: Question.select("COUNT(questions.id)")
                                   .where("polls.id = questions.poll_id")
                                   .group("questions.poll_id"))

  end
end
