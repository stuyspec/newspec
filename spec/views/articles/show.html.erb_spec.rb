require 'rails_helper'

RSpec.describe "articles/show", type: :view do
  before(:each) do
    assign(:article, build(:article, title: "My Title", text: "some text",
                           author: build(:author, first: "Jake", last: "Waksbaum")
                          ))

    render
  end

  it "includes the title" do
    expect(rendered).to include "My Title"
  end

  it "includes the author" do
    expect(rendered).to include "Jake Waksbaum"
  end

  it "includes the text" do
    expect(rendered).to include "some text"
  end
end
