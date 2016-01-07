require 'rails_helper'

RSpec.describe 'articles/index' do
  before(:each) do
    author1 = build(:author, first: 'Jake', last: 'Waksbaum')
    author2 = build(:author, first: 'Max',  last: 'Fishelson')
    assign(:articles, [
      build(:article, title: 'Stuff happened', author: author1),
      build(:article, title: 'OTHER STUFF ALSO HAPPENED', author: author2)
    ])

    render
  end

  it 'incudes the titles' do
    expect(rendered).to include 'Stuff happened', 'OTHER STUFF ALSO HAPPENED'
  end

  it 'includes the authors' do
    expect(rendered).to include 'Jake Waksbaum', 'Max Fishelson'
  end
end
