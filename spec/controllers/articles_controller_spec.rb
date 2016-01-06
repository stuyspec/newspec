require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let!(:articles) do
    [
      create(:article, issue: Issue.new(2015, 1), slug: 'my-cool-article'),
      create(:article, issue: Issue.new(2015, 1), slug: 'my-other-article'),
      create(:article, issue: Issue.new(2015, 2), slug: 'my-cool-article'),
      create(:article, issue: Issue.new(2016, 2))
    ]
  end

  before(:all) do
    DatabaseCleaner.start
    create(:unpublished, issue: Issue.new(2015, 3), slug: 'not-ready')
    create(:unpublished, issue: Issue.new(2014, 3))
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe '#by_year' do
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

  describe '#by_issue' do
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
      before(:each) { get :by_issue, year: '2015', issue_num: '3' }

      it "assigns the issue to @issue" do
        expect(assigns(:issue)).to eq Issue.new(2015, 3)
      end

      it { expect(assigns(:articles)).to eq [] }
    end
  end

  describe '#by_slug' do
    context 'an article with that slug in that issue exists' do
      before(:each) do
        get :by_slug, year: '2015', issue_num: '1', slug: 'my-cool-article'
      end

      it "assigns the article to @article" do
        expect(assigns(:article)).to eq articles[0]
      end
    end

    context 'an article with that slug exists only in another issue' do
      before(:each) do
        get :by_slug, year: '2015', issue_num: '2', slug: 'my-other-article'
      end

      it { expect(assigns(:article)).to eq Article::NoArticle }
    end

    context 'an unpublished article with that slug exists' do
      before(:each) do
        get :by_slug, year: '2015', issue_num: '3', slug: 'not-ready'
      end

      it { expect(assigns(:article)).to eq Article::NoArticle }
    end

    context 'no articles with that slug exist' do
      before(:each) do
        get :by_slug, year: '2015', issue_num: '3', slug: 'not-ready'
      end

      it { expect(assigns(:article)).to eq Article::NoArticle }
    end
  end
end
