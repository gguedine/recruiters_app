FactoryBot.define do
  factory :job do
    title { Faker::Job.title }
    description { Faker::Job.field }
    skills { Faker::Job.key_skill }
    status { "active" }
    start_date { "24/03/2022" }
    end_date { "30/06/2022" }
    recruiter { nil }

    trait :with_recruiter do
      association :recruiter
    end

    trait :valid do
      association :recruiter
    end
  end
end
