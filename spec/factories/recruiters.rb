FactoryBot.define do
  factory :recruiter do
    email { Faker::Internet.unique.safe_email }
    name { Faker::Name.name }
    password { Faker::Internet.password }
  end
end
