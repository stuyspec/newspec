require 'rails_helper'

RSpec.describe Profile, :type => :model do
  subject { build(:profile) }

  context "being created" do

    it { is_expected.to be_valid }

    it "can be blak" do
      profile = build(:blank_profile)
      expect(profile).to be_valid
    end

    it { is_expected.not_to be_invalid_without :first }
    it { is_expected.not_to be_invalid_without :last }
    it { is_expected.not_to be_invalid_without :email }

  end

  describe "#name" do

    it "returns the name" do
      expect(subject.name).to be_eql "Jake Waksbaum"
    end

  end

end
