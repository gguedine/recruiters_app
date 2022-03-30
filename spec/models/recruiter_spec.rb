require 'rails_helper'

RSpec.describe Recruiter, type: :model do
  let(:recruiter) { create(:recruiter ) }
  subject { recruiter }

  describe "associations" do
    it { is_expected.to have_many(:jobs) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }

    context "has secure password" do
      describe "when password is not present" do
        let(:recruiter) { build(:recruiter, password: nil ) }
        it { should_not be_valid }
      end

      describe "return value of authenticate method" do
        let(:recruiter) { build(:recruiter)}
        before { recruiter.save }
        let(:found_recruiter) { Recruiter.find_by(email: recruiter.email) }

        describe "with valid password" do
          it { should eq found_recruiter.authenticate(recruiter.password) }
        end

        describe "with invalid password" do
          let(:recruiter_for_invalid_password) { found_recruiter.authenticate("invalid") }

          it { should_not eq recruiter_for_invalid_password }
          specify { expect(recruiter_for_invalid_password).to be_falsey }
        end
      end
    end
  end
end
