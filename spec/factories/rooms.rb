FactoryBot.define do
  factory :room do
    name { "MyString" }
    city { "MyString" }
    price { 1 }
    size { 1 }
    bed_type { "MyString" }
    facilities { "MyText" }
    picture { "MyString" }
    user { nil }
  end
end
