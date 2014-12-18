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
