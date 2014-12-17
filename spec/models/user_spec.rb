require 'rails_helper'
require 'rspec/expectations'

describe User do

  describe "create a User" do
    describe "username" do
      it "is valid with a username only" do
        user = User.new username: 'jake.waksbaum'
        expect(user).to be_valid
      end

      it "is invalid without a username" do
        user = User.new username: nil
        user.valid?
        expect(user.errors[:username]).to include "can't be blank"
      end
    end

    describe "profile" do
      it "creates a blank Profile" do
        user = User.new username: 'jake.waksbaum'
        expect(user.profile).to_not be_nil
        expect{user.save!}.to change{user.profile.id.nil?}.from(true).to(false)
      end

      it "uses an existing Profile" do
        profile = Profile.create!
        user = User.new username: 'jake.waksbaum', profile: profile
        expect(user).to be_valid
      end
    end

    describe "role" do
      it "is assigned the default Role" do
        user = User.new username: 'jake.waksbaum'
        expect(user.role).to be_eql Role.default
      end

      it "uses an alternative Role" do
        role = Role.create! name: "Writer", caps: ["write"]
        user = User.new username: 'jake.waksbaum', role: role
        expect(user).to be_valid
      end
    end

    describe "department" do
      it "should be valid with a department" do
        department = Department.create! name: "web"
        user = User.new username: 'jake.waksbaum', department: department
        expect(user.department).to be_eql department
      end
    end

  end

  describe "#can?" do
    before :each do
      @role = Role.create! name: "Writer", caps: ["write"]
      @user = User.create! username: 'jake.waksbaum', role: @role
    end

    it "determines if it can do an action" do
      expect(@user).to be_able_to 'write'
    end

    it "determines if it cannot do an action" do
      expect(@user).not_to be_able_to 'delete'
    end

  end

end

RSpec::Matchers.define :be_able_to do |action|
  match do |user|
    user.can? action
  end
  description do
    "be permitted to #{action}"
  end
end
