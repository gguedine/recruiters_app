require "rails_helper"

RSpec.describe Submission, type: :model do
  subject { submission }

  let(:submission) { create(:submission, :with_job) }

  describe "associations" do
    it { is_expected.to belong_to(:job) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:mobile_phone) }
    it { is_expected.to validate_presence_of(:resume) }
    it { is_expected.to validate_uniqueness_of(:job_id).scoped_to(:email) }
  end
end
