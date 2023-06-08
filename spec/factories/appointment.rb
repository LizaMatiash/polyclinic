FactoryBot.define do
  factory :appointment do
    user
    doctor
    status { true }
  end
end
