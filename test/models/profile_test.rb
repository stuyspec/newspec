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
#  user_id    :integer
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
