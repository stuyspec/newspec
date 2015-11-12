require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let!(:articles) do
    [
      create(:article, issue: Issue.new(2015, 1)),
      create(:article, issue: Issue.new(2015, 1)),
      create(:article, issue: Issue.new(2015, 2)),
      create(:article, issue: Issue.new(2016, 2))
    ]
  end

  before(:each) do
    create(:unpublished, issue: Issue.new(2015, 3))
    create(:unpublished, issue: Issue.new(2014, 3))
  end

  describe 'GET #by_year' do
    context 'articles with that year exist' do
      before(:each) { get :by_year, year: '2015' }
      it 'assigns issues in that year as @issues' do
        expect(assigns(:issues)).to eq(
          Issue.new(2015, 1) => [articles[0], articles[1]],
          Issue.new(2015, 2) => [articles[2]]
        )
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

  describe 'GET #by_issue' do
    context 'articles with that issue exist' do
      before(:each) { get :by_issue, year: '2015', issue_num: '1' }

      it 'assigns the issue to @issue' do
        expect(assigns(:issue)).to eq(Issue.new(2015, 1))
      end

      it 'assigns the articles in that issue as @articles' do
        expect(assigns(:articles)).to eq(articles[0..1])
      end
    end

    context 'no articles with that issue exist' do
      before(:each) { get :by_issue, year: '2012', issue_num: '1' }

      it "assigns the issue to @issue" do
        expect(assigns(:issue)).to eq Issue.new(2012, 1)
      end

      it { expect(assigns(:articles)).to eq [] }
    end

    context 'only unpublished articles with that issue exist' do
      before(:each) { get :by_issue, year: "2015", issue_num: "3" }

      it 'assigns the issue to @issue' do
        expect(assigns(:issue)).to eq Issue.new(2015, 3)
      end

      it { expect(assigns(:articles)).to eq [] }
    end
  end
end
