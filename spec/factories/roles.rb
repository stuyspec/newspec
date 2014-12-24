# == Schema Information
#
# Table name: roles
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  capabilities :string(255)      default([]), is an Array
#  created_at   :datetime
#  updated_at   :datetime
#

FactoryGirl.define do

  factory :role, aliases: [:admin] do

    name "admin"
    capabilities %i(read write delete)
  end

  factory :writer, class: Role do
    name "writer"
    capabilities %i(write)
  end

end
