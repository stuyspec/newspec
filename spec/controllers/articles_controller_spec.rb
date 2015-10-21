require 'rails_helper'

RSpec.describe ArticlesController do

  describe "GET #index" do
    it "assigns published articles as @articles" do
      articles = [
        create(:article),
        create(:article)
      ]
      create(:unpublished)
      get :index
      expect(assigns(:articles)).to eq(articles)
    end
  end

  describe "GET #show" do
    it "assigns the requested article as @article" do
      article = create(:article)
      get :show, id: article.id
      expect(assigns(:article)).to eq(article)
    end

    it "404s for a nonexistant article" do
      expect do
        get :show, id: 1
      end.to raise_error ActionController::RoutingError
    end

    it "404s for an unpublished article" do
      article = create(:unpublished)
      expect do
        get :show, id: article.id
      end.to raise_error ActionController::RoutingError
    end

  end
end
