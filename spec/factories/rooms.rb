FactoryBot.define do
  factory :room do
    name { 'Bachelor Room' }
    city { Faker::Address.city }
    price { 156 }
    size { 20 }
    bed_type { 'One bed' }
    facilities { 'TV, Telephone, Closet' }
    picture { Rack::Test::UploadedFile.new('spec/fixtures/files/room.jpg', 'image/jpeg') }
    user
  end
end
