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
#  user_id      :integer
#

require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
