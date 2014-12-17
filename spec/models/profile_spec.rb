require 'rails_helper'

describe Profile do
  subject { build(:profile) }

  context "being created" do

    it "takes no arguments" do
      profile = build(:blank_profile)
      expect(profile).to be_valid
    end

    it { is_expected.to be_valid }
  end

  describe "#name" do
    it "returns the name" do
      expect(subject.name).to be_eql "Jake Waksbaum"
    end
  end

end
