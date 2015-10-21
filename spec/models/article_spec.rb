require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:now) { DateTime.now }

  describe ".published" do
    it "returns only published articles" do
      pub1 = create(:article, publish_date: now)
      pub2 = create(:article, publish_date: now - 2.weeks)
      npub = create(:article, publish_date: now + 1.day)

      expect(Article.published).to contain_exactly pub1, pub2
    end
  end

  describe ".find_published" do
    context "article exists" do
      it "finds it when published" do
        article = create(:article, publish_date: now - 1.week)
        id = article.id
        expect(Article.find_published(id)).to eq article
      end

      it "is NoArticle when not published" do
        article = create(:article, publish_date: now + 1.week)
        id = article.id
        expect(Article.find_published(id)).to eq Article::NoArticle
      end
    end

    context "article does not exist" do
      it "is NoArticle" do
        expect(Article.find_published(1)).to eq Article::NoArticle
      end
    end
  end

  describe "#published?" do
    it "is published articles published before now" do
      article = build(:article, publish_date: now - 1.week)
      expect(article).to be_published
    end

    it "is not published for articles published after now" do
      article = build(:article, publish_date: now + 1.week)
      expect(article).not_to be_published
    end

    it "is not published for nil publish_date" do
      article = build(:article, publish_date: nil)
      expect(article).not_to be_published
      expect(article.publish_date).to be nil
    end
  end

  describe "validations" do
    it "is valid without text when unpublished" do
      article = build(:unpublished)
      expect(article).to be_valid
    end

    it "is invalid without text when published" do
      article = build(:article, text: '')
      expect(article).not_to be_valid
    end

    it "does not allow two articles with same title" do
      article1 = create(:article, title: "A Title")
      article2 = build(:article, title: "A Title")
      expect(article2).not_to be_valid
    end

    it "allows unpublished artilces with duplicate titles" do
      article1 = create(:unpublished, title: "A Title")
      article2 = build(:unpublished, title: "A Title")
      expect(article2).to be_valid
    end
  end
end
