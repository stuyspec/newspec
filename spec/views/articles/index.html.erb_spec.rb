require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      build(:article, title: "Stuff happened"),
      build(:article, title: "OTHER STUFF ALSO HAPPENED")
    ])

    render
  end

  it "incudes the titles" do
    expect(rendered).to include "Stuff happened", "OTHER STUFF ALSO HAPPENED"
  end
end
