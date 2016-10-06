phases = [1, 2, 3]
types = ['Mentor', '']
User.create!(group: 'mentor', name: Faker::Name.name, email: Faker::Internet.email, password: 'password', phase: phases.sample)

User.create!(group: 'mentor', name: Faker::Name.name, email: Faker::Internet.email, password: 'password', phase: phases.sample)

User.create!(group: 'mentor', name: Faker::Name.name, email: Faker::Internet.email, password: 'password', phase: phases.sample)

User.create!(group: 'mentor', name: Faker::Name.name, email: Faker::Internet.email, password: 'password', phase: phases.sample)

User.create!(group: 'mentor', name: Faker::Name.name, email: Faker::Internet.email, password: 'password', phase: phases.sample)

User.create!(group: 'student', name: Faker::Name.name, email: Faker::Internet.email, password: 'password', phase: phases.sample)

User.create!(group: 'student', name: Faker::Name.name, email: Faker::Internet.email, password: 'password', phase: phases.sample)

User.create!(group: 'student', name: Faker::Name.name, email: Faker::Internet.email, password: 'password', phase: phases.sample)

User.create!(group: 'student', name: Faker::Name.name, email: Faker::Internet.email, password: 'password', phase: phases.sample)

User.create!(group: 'student', name: Faker::Name.name, email: Faker::Internet.email, password: 'password', phase: phases.sample)

50.times {Pairing.create!(start_time: Faker::Time.between(DateTime.now - 1, DateTime.now), mentor_id: rand(1..5), student_id: rand(6..10))}

Topic.create!(name: 'recursion')
Topic.create!(name: 'iteration')
Topic.create!(name: 'active-record')
Topic.create!(name: 'ajax')
Topic.create!(name: 'rails')
Topic.create!(name: 'inheritance')
Topic.create!(name: 'enumerables')
Topic.create!(name: 'MVC')
Topic.create!(name: 'associations')
Topic.create!(name: 'schemas')

50.times {Feedback.create!(feedbackable_id: rand(1..10), )}

