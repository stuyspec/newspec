# == Schema Information
#
# Table name: roles
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  capabilities :string(255)      default([]), is an Array
#  default      :boolean          default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test "needs a name" do
    role = Role.new
    assert_not role.save, "Saved role without a name"
  end

  test "name is unique" do
    role = Role.new name:"Writer"
    assert_not role.save, "Role with duplicate name saved"
  end

  test "there can only be one default" do
    default = Role.new name: "Editor", default:true
    assert default.save, "Did not save a default role"
    default2 = Role.new name: "Author", default: true
    assert_not default2.save, "Saved a second default role"
  end

  test "role saves" do
    assert Role.create(name: "Author"), "Role did not save"
  end

end
