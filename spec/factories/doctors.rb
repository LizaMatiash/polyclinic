FactoryBot.define do
  factory :doctor do
    password { '12345678' }
    password_confirmation { '12345678' }

    trait :valid do
      phone { Faker::Number.unique.number(digits: 10).to_s }
    end
  end
end
