require 'rails_helper'
require 'rspec/expectations'

describe User do
  let(:writer) { build(:writer) }

  context "being created" do
    subject {build(:user)}

    it { is_expected.to be_valid }

    it { is_expected.to be_invalid_without :username }

    it "creates a blank Profile" do
      user = build(:miki)
      expect(user.profile).to_not be_nil
    end

    it "uses an existing Profile" do
      user = build(:user)
      expect(user).to be_valid
      expect(user.profile.hash).to be_equal build(:profile).hash
    end

    it "is assigned the default Role" do
      user = build(:user)
      expect(user.role.hash).to be_eql build(:default_role).hash
    end

    it "uses an alternative Role" do
      user = build(:user, role: writer)
      expect(user).to be_valid
    end

  end

  describe "#can?" do
    subject { build(:user, role: writer) }

    it { is_expected.to be_able_to 'write' }

    it { is_expected.not_to be_able_to 'delete' }

  end
end
