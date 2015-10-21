require 'rails_helper'

RSpec.describe "articles/show", type: :view do
  before(:each) do
    @article = assign(:article, double(:article, title: "My Title", text: "some text"))

    render
  end

  it "includes the title" do
    expect(rendered).to include "My Title"
  end

  it "includes the text" do
    expect(rendered).to include "some text"
  end
end
