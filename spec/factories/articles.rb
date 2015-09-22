FactoryGirl.define do
  factory :article do
    title "Stuff Happened"
    slug "stuff-happened"
    #authors [ 1 ]
    publish_date DateTime.now - 1.week
    #issue 1
    #year 2016 
    #dept 1
  end

end
