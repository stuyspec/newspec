require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test "create a user" do
        user = User.new do |u|
            u.username = "user1"
        end
        assert user.save
    end

    test "need a username" do
        user = User.new
        assert_not user.save, "Saved user without a username"
    end

    test "usernames should be unique" do
        assert_not 2.times.collect {
            user = User.new username: "user1"
            user.save
        }.all?
    end
end
