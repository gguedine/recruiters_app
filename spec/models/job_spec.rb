require 'rails_helper'
require './spec/concerns/filterable'

RSpec.describe Job, type: :model do
  let(:job) { create(:job, :with_recruiter ) }
  subject { job }

  it_behaves_like "Filterable", { title: Faker::Job.unique.title ,
                                 description: Faker::Job.unique.field,
                                 skills: Faker::Job.unique.key_skill }

  describe "associations" do
    it { is_expected.to belong_to(:recruiter) }
    it { is_expected.to have_many(:submissions) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:skills) }
    it { should define_enum_for(:status).with([:active, :inactive]) }
  end

  describe "scopes" do
    describe ".active" do
      let(:job) { create(:job,:with_recruiter, status: :active) }
      it { expect(described_class.active).to include(job)}
    end
  end
end
