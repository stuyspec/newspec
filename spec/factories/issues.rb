FactoryGirl.define do
  factory :issue do
    number 1
    publish_date { Time.now + 1.month }
    year
  end

end
