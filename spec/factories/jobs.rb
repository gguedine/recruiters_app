FactoryBot.define do
  factory :job do
    title { "MyString" }
    description { "MyText" }
    start_date { "2022-03-24 01:47:52" }
    end_date { "2022-03-24 01:47:52" }
    status { "MyString" }
    skills { "MyText" }
    recruiter { nil }
  end
end
