require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test "need a username" do
        user = User.new
        assert_not user.save, "Saved user without a username"
    end

    test "usernames should be unique" do
        assert_not 2.times.collect {
            user = User.new username: "user1"
            user.save
        }.all?, "Saved with a non-unique username"
    end

    test "users should have a profile" do
        user = User.create username: "joe"
        assert user.profile, "User did not have a profile"
    end

    test "users can use existing profiles" do
        profile = Profile.create first: "Joe", last: "Schmo"
        user = User.create username: "joe.schmoe", profile: profile
        assert_same user.profile, profile, "Profile was not set during create"
    end
end
