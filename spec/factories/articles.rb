FactoryGirl.define do
  factory :article do
    title "Stuff Happened"
    slug "stuff-happened"
    #authors [ 1 ]
    text """
    this is my article. some stuff has gone down.
    Alon Levin thinks some shit is antisemeitic bc people don't like Israel
    """
    publish_date DateTime.now - 1.week

    factory :unpublished do
      publish_date DateTime.now + 1.week
    end
    #issue 1
    #year 2016 
    #dept 1
  end

end
