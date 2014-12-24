require 'rails_helper'

RSpec.describe User, :type => :model do
  subject {build(:user)}
  let(:writer) { build(:writer) }

  context "being created" do

    it { is_expected.to be_valid }
    it { is_expected.to be_invalid_without :username }

    it "creates a blank Profile" do
      user = build(:miki)
      expect(user.profile).to_not be_nil
    end

    it "uses an existing Profile" do
      user = build(:user)
      expect(user).to be_valid
      expect(user.profile.hash).to be_eql build(:profile).hash
    end

    it "is assigned the default Role" do
      user = build(:miki)
      expect(user.role).to be_eql Role.default
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

  it { is_expected.to respond_to :articles}
end
