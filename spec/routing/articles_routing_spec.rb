require "rails_helper"

RSpec.describe ArticlesController, type: :routing do
  describe "routing" do

    it "routes to #by_year" do
      expect(:get => "/2016").to route_to("articles#by_year", :year => "2016")
    end

    it "routes to #by_issue" do
      expect(:get => "/2016/1").to route_to("articles#by_issue", :year => "2016", :issue => "1")
    end

    it "routes to #by_slug" do
      expect(:get => "/2016/1/my-cool-article").to route_to("articles#by_slug", :year => "2016", :issue => "1", :slug => "my-cool-article")
    end

  end
end
