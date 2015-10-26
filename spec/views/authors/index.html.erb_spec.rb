require 'rails_helper'

RSpec.describe "authors/index.html.erb", type: :view do
  before(:each) do
    assign(:authors, [
      build(:author, first: "Jake",  last: "Waksbaum"),
      build(:author, first: "Ari",   last: "Hatzimemos"),
      build(:author, first: "Louis", last: "Susser")
    ])

    render
  end

  it "includes their names" do
    expect(rendered).to include "Jake Waksbaum", "Ari Hatzimemos", "Louis Susser"
  end

end
