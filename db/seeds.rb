User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

ActiveRecord::Base.connection.tables.each do |table|
  ActiveRecord::Base.connection.reset_pk_sequence!(table)
end

# Users
ronaldo = User.create!(username: "ronaldo1987")
tevez = User.create!(username: "tevez1987")
cristiano = User.create!(username: "cristiano1987")

# Polls
game_poll = Poll.create!(author_id: ronaldo.id, title: "Game Theme Poll")
movie_pool = Poll.create!(author_id: ronaldo.id, title: "Movie Theme Poll")
book_pool = Poll.create!(author_id: tevez.id, title: "Book Theme Poll")

# Game Poll Questions
elder_ring_question = Question.create!(poll_id: game_poll.id, text: "What do you think of Elder Ring?")
crash_bash_question = Question.create!(poll_id: game_poll.id, text: "What do you think about Crash Bash?")

# Books Questions
java_question = Question.create!(poll_id: book_pool.id, text: "What do you think about Head First Java?")
random_book = Question.create!(poll_id: book_pool.id, text: "What do you think about this random book?")

# Elder ring Choices
good_game = AnswerChoice.create!(question_id:  elder_ring_question.id, text: "Good Game")
bad_game = AnswerChoice.create!(question_id:  elder_ring_question.id, text: "Bad Game")

# Crash bash Choices
good_crash_game = AnswerChoice.create!(question_id:  crash_bash_question.id, text: "Good Game")
bad_crash_game = AnswerChoice.create!(question_id:  crash_bash_question.id, text: "Bad Game")

# Head First Java Choices
good_book = AnswerChoice.create!(question_id: java_question.id, text: "Good book")
bad_book = AnswerChoice.create!(question_id: java_question.id, text: "Bad book")

# Random Book Choices
good_random_book = AnswerChoice.create!(question_id: random_book.id, text: "Good book")
bad_random_book = AnswerChoice.create!(question_id: random_book.id, text: "Bad book")

# Teves Responses
response1 = Response.create!(user_id: tevez.id, answer_choice_id: good_game.id)

# Ronaldo Responses
response2 = Response.create!(user_id: ronaldo.id, answer_choice_id: bad_book.id)

# Ronaldo Responses
response3 = Response.create!(user_id: cristiano.id, answer_choice_id: good_crash_game.id)
response4 = Response.create!(user_id: cristiano.id, answer_choice_id: good_game.id)
response5 = Response.create!(user_id: cristiano.id, answer_choice_id: good_random_book.id)
