require "rails_helper"

RSpec.describe ArticlesController do
  render_views

  it "returns json" do
    article = build :article
    articles = [ article ]
    allow(Article).to receive(:published) { articles }
    get :index
    expect(assigns(:articles)).to be articles
  end
end
