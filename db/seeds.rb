User.destroy_all
Poll.destroy_all
Question.destroy_all

ActiveRecord::Base.connection.tables.each do |table|
  ActiveRecord::Base.connection.reset_pk_sequence!(table)
end

ronaldo = User.create(username: "ronaldo1987")
game_poll = Poll.create(author_id: ronaldo.id, title: "Game Theme Poll")
elder_ring_question = Question.create(poll_id: game_poll.id, text: "What do you think of Elder Ring?")