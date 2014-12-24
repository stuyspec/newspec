# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  first      :string(255)
#  last       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Profile, :type => :model do
  subject { build(:profile) }

  context "being created" do

    it { is_expected.to be_valid }

    it "can be blank" do
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
