require "rails_helper"

describe User do
  subject(:user) { build(:user) }

  context "#valid?" do
    subject { user.valid? }

    context "when email is present" do
      it { is_expected.to be_truthy }
    end

    context "when email is missing" do
      before { user.email = nil }

      it { is_expected.to be_falsy }

      it "contains errors" do
        subject
        expect(user.errors[:email]).to include("can't be blank")
      end
    end

    context "when password is present" do
      it { is_expected.to be_truthy }
    end

    context "when password is missing" do
      before { user.password = nil }

      it { is_expected.to be_falsy }

      it "contains errors" do
        subject
        expect(user.errors[:password]).to include("can't be blank")
      end
    end
  end
end
