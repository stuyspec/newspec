require 'rails_helper'

describe Profile do

  describe "create a Profile" do
    it "takes no arguments" do
      profile = Profile.new
      expect(profile).to be_valid
    end

    it "takes arguments" do
      jake = Profile.new first: "jake", last: "Waksbaum"
      expect(jake).to be_valid
    end
  end

  it "returns the name" do
    jake = Profile.new first: "jake", last: "Waksbaum"
    expect(jake.name).to be_eql "Jake Waksbaum"
  end
end
