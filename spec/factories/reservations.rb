FactoryBot.define do
  factory :reservation do
    nights { 1 }
    check_in { '2021-11-30' }
    user { nil }
    room { nil }
  end
end
