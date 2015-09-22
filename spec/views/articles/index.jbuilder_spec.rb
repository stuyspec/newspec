require "rails_helper"
require "active_support"

RSpec.describe "articles/index" do
  it "renders JSON correctly" do
    article = double(:article,
                     :id => 1,
                     :title => "My Title",
                     :slug => "my-title",
                     :html => "This is my cool article",
                     :publish_date => DateTime.parse("2015/09/15")
                    )
    assign(:articles, [article])

    render

    expect(ActiveSupport::JSON.decode rendered).to be_eql({
      :articles => [
        :id => 1,
        :title => "My Title",
        :url   => "/my-title",
        :excerpt => "This is my cool article",
      ]
    })
  end
end
