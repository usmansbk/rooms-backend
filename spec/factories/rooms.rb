FactoryBot.define do
  factory :room do
    name { Faker::Name.name }
    city { Faker::Address.city }
    price { 10 }
    size { 20 }
    bed_type { Faker::Company.type }
    facilities { Faker::House.room }
    picture { Faker::Company.logo }
    user
  end
end
