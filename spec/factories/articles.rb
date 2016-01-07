FactoryGirl.define do
  factory :article do
    association :author, factory: %(:author, :unique_slug)
    sequence(:title) { |n| "Stuff Happened - #{n}" }

    issue Issue.new(2015, 1)
    slug { title.parameterize }
    text ''"
    this is my article. some stuff has gone down.
    Alon Levin thinks some shit is antisemeitic bc people don't like Israel
    "''
    publish_date DateTime.now.current - 1.week

    factory :unpublished do
      publish_date DateTime.now.current + 1.week
    end

    trait :unique_slug do
      after(:build) do |article|
        article.slug = Article.slug_for(article)
      end
    end
  end
end
