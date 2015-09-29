require "rails_helper"
require "active_support"

RSpec.describe "articles/index" do
  before do
    article1 = create(:article, title: "Stuff happened", text: "check me out\nthe stuff")
    article2 = create(:article, title: "Louis is a genius", text: "Louis suser recently receive an IQ score of 1 billion billion\n and a half")
    article3 = create(:article, title: "blahhhh")
    articles = [ article1, article2, article3 ]
    assign(:articles, articles)
    render
  end

  it "includes titles" do
    expect(rendered).to include "Stuff happened", "Louis is a genius", "blahhhh"
  end
end
