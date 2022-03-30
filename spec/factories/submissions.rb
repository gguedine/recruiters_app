FactoryBot.define do
  factory :submission do
    name { Faker::Name.name }
    email { Faker::Internet.unique.safe_email }
    mobile_phone { Faker::PhoneNumber.cell_phone }
    resume { Faker::Job.field }
    job { nil }

    trait :with_job do
      association :job, factory: [:job, :with_recruiter]
    end
  end
end
