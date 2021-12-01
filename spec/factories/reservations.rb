FactoryBot.define do
  factory :reservation do
    nights { rand(1...30) }
    check_in { Faker::Date.in_date_period }
    user
    room
  end
end
