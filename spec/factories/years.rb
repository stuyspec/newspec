# == Schema Information
#
# Table name: years
#
#  id         :integer          not null, primary key
#  year       :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :year do
    year 2014
  end

end
