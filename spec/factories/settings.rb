# == Schema Information
#
# Table name: settings
#
#  id         :integer          not null, primary key
#  type       :string(255)      not null
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :default_role, :class => 'Settings::DefaultRole' do
    role
  end

end
