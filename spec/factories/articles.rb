# == Schema Information
#
# Table name: articles
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  author_id     :integer
#  status        :string(255)
#  publish_date  :datetime
#  created_at    :datetime
#  updated_at    :datetime
#  department_id :integer
#  issue_id      :integer
#

FactoryGirl.define do
  factory :article do
    title "Jake Waksbaum is voted sexiest man alive"
    author
    publish_date { Time.now + 1.week }
    department
    status "eic"
    issue
  end

end
