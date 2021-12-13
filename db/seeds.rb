# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = FactoryBot.create :user, password: 'password', email: 'test@gmail.com', name: 'Test'

10.times do |n|
	room = FactoryBot.create(:room, user: user)
	FactoryBot.create(:reservation, room: room, user: user)
end