require "rails_helper"

RSpec.describe Recruiter, type: :model do
  subject { recruiter }

  let(:recruiter) { create(:recruiter) }

  describe "associations" do
    it { is_expected.to have_many(:jobs) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }

    context "with secure password" do
      describe "when password is not present" do
        let(:recruiter) { build(:recruiter, password: nil) }

        it { is_expected.not_to be_valid }
      end

      describe "return value of authenticate method" do
        let(:recruiter) { build(:recruiter) }
        let(:found_recruiter) {
          described_class.find_by(email: recruiter.email)
        }

        before { recruiter.save }

        describe "with valid password" do
          it {
            expect(subject).to eq found_recruiter.authenticate(recruiter.password)
          }
        end

        describe "with invalid password" do
          let(:recruiter_for_invalid_password) {
            found_recruiter.authenticate("invalid")
          }

          it { is_expected.not_to eq recruiter_for_invalid_password }
          specify { expect(recruiter_for_invalid_password).to be_falsey }
        end
      end
    end
  end
end
