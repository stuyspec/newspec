require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let!(:articles) {[
    create(:article, issue: Issue.new(2015, 1)),
    create(:article, issue: Issue.new(2015, 1)),
    create(:article, issue: Issue.new(2015, 2)),
    create(:article, issue: Issue.new(2016, 2))
  ]}

  before(:each) do
    create(:unpublished, issue: Issue.new(2015, 3))
    create(:unpublished, issue: Issue.new(2014, 3))
  end

  describe 'GET #by_year' do
    context "articles with that year exist" do
      before(:each) { get :by_year, year: '2015' }
      it 'assigns issues in that year as @issues' do
        expect(assigns(:issues)).to eq({
          Issue.new(2015, 1) => [ articles[0], articles[1] ],
          Issue.new(2015, 2) => [ articles[2] ],
        })
      end
    end
  end

  context 'no articles exist with that year' do
    before(:each) { get :by_year, year: '2012' }
    it { expect(assigns(:issues)).to eq({}) }
  end

  context 'only unpublished article exist with that year' do
    before(:each) { get :by_year, year: '2014' }
    it { expect(assigns(:issues)).to eq({}) }
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
