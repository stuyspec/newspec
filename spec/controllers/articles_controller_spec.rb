require "rails_helper"

RSpec.describe ArticlesController do
  it "returns json" do
    article = double(:article)
    articles = [ article ]
    allow(Article).to receive(:published) { articles }
    get :index
    expect(assigns(:articles)).to be articles
  end
end
