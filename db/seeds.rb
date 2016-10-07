phases = [1, 2, 3]

10.times {User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: 'password', phase: phases.sample)}

50.times {Pairing.create!(start_time: Faker::Time.between(DateTime.now - 1, DateTime.now), mentor_id: rand(1..10))}

Pairing.create!(start_time: Faker::Time.between(DateTime.now - 1, DateTime.now), mentor_id: 5, student_id: 9)
Feedback.create!(rating: rand(1..5), comment: 'comment', pairing_id: 1, user_id: 5)
Feedback.create!(rating: rand(1..5), comment: 'comment', pairing_id: 1, user_id: 9)


Pairing.create!(start_time: Faker::Time.between(DateTime.now - 1, DateTime.now), mentor_id: 2, student_id: 10)
Feedback.create!(rating: rand(1..5), comment: 'comment', pairing_id: 16, user_id: 2)
Feedback.create!(rating: rand(1..5), comment: 'comment', pairing_id: 16, user_id: 10)

Role.create!(role: "Student")
Role.create!(role: "Mentor")
Role.create!(role: "Both")

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
