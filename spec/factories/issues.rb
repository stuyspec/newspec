# == Schema Information
#
# Table name: issues
#
#  id           :integer          not null, primary key
#  number       :integer
#  publish_date :datetime
#  done         :boolean          default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#  year_id      :integer
#

FactoryGirl.define do
  factory :issue do
    number 1
    publish_date { Time.now + 1.month }
    year
  end

end
