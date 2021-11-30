FactoryBot.define do
  factory :room do
    name { Faker::Name.name }
    city { Faker::Address.city }
    price { 10 }
    size { 20 }
    bed_type { Faker::Company.type }
    facilities { Faker::House.room }
    picture { Rack::Test::UploadedFile.new('spec/fixtures/files/room.jpg', 'image/jpeg') }
    user
  end
end
