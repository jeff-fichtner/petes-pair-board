50.times {User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: 'password', phase: rand(1..3))}

100.times {Pairing.create!(start_time: Faker::Time.between(DateTime.now - 2, DateTime.now + 2), mentor_id: rand(1..50))}
100.times {Pairing.create!(start_time: Faker::Time.between(DateTime.now - 2, DateTime.now + 2), mentor_id: rand(1..50), student_id: rand(1..50))}

Pairing.create!(start_time: Faker::Time.between(DateTime.now - 1, DateTime.now), mentor_id: 5, student_id: 9)
Feedback.create!(rating: rand(1..5), comment: 'comment', pairing_id: 1, user_id: 5)
Feedback.create!(rating: rand(1..5), comment: 'comment', pairing_id: 1, user_id: 9)

Pairing.create!(start_time: Faker::Time.between(DateTime.now - 1, DateTime.now), mentor_id: 2, student_id: 10)
Feedback.create!(rating: rand(1..5), comment: 'comment', pairing_id: 16, user_id: 2)
Feedback.create!(rating: rand(1..5), comment: 'comment', pairing_id: 16, user_id: 10)

Topic.create!(topic: 'recursion')
Topic.create!(topic: 'iteration')
Topic.create!(topic: 'active-record')
Topic.create!(topic: 'ajax')
Topic.create!(topic: 'rails')
Topic.create!(topic: 'inheritance')
Topic.create!(topic: 'enumerables')
Topic.create!(topic: 'MVC')
Topic.create!(topic: 'associations')
Topic.create!(topic: 'schemas')

70.times {TopicsUser.create!(topic_id: rand(1..10), mentor_id: rand(1..50))}
