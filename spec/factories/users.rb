FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }

    factory :user_with_rooms do
      transient do
        rooms_count { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:room, evaluator.rooms_count, user: user)

        user.reload
      end
    end

    factory :user_with_reservations do
      transient do
        reservations_count { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:reservation, evaluator.reservations_count, user: user)

        user.reload
      end
    end
  end
end
