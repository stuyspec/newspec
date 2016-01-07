require 'rails_helper'

RSpec.describe 'authors/show.html.erb', type: :view do
  before(:each) do
    assign(:author, build(:author, first: 'Jake', last: 'Waksbaum'))
    render
  end

  it 'includes the name' do
    expect(rendered).to include 'Jake Waksbaum'
  end
end
