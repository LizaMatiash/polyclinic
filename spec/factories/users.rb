FactoryBot.define do
  factory :user do
    phone { Faker::Number.unique.number(digits: 10).to_s }
    password { '12345678' }
    password_confirmation { '12345678' }
  end
end
