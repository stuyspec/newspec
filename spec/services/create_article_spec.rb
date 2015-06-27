require 'spec_helper'
require_relative '../../services/create_article'
require 'ostruct'

RSpec.describe CreateArticle, :new do

  let!(:article_source) do
    ->(attrs) do
      article = OpenStruct.new.tap do |article|
        attrs.each { |k, v| article[k] = v }
        def article.select(*) self end
      end
    end
  end

  let!(:params) do
    {
     title: "Cool new article",
     issue: 3,
     year: 2012,
     status: :published,
     department: :news,
     publish_date: DateTime.now
    }
  end

  context "with all parameters present" do
    let(:factory) { CreateArticle.new(article_source, nil) }

    it "passes on given parameters" do
      article = factory.call params
      expect(article.to_h.slice(*params.keys)).to be_eql params
    end
  end

  default_attrs = %i(issue year status publish_date)
  context "without #{default_attrs.to_sentence last_word_connector: ' or '}" do
    let(:factory) { CreateArticle.new(article_source, defaults) }
    let(:defaults) do OpenStruct.new \
        issue: 1,
        year: 2015,
        status: :draft,
        publish_date: DateTime.now + 1.week
    end

    default_attrs.each do |attr|
      it "provides a default #{attr}" do
        article = factory.call params.except(attr)
        expect(article.send attr).to be_eql defaults.send attr
      end
    end
  end

  context "with an author" do
    let(:factory) { CreateArticle.new(article_source, nil) }

    it "gets the first user's department" do
      authors = [:web, :opinions, :sports].map { |dept| { :department => dept } }.map &OpenStruct.public_method(:new)
      article = factory.call params.except(:department).merge(authors: authors)
      expect(article.department).to be_eql authors[0].department
    end

    it "ignores a user without a department" do
      article = factory.call params.except(:department).merge(authors: [OpenStruct.new])
      expect(article.department).to be_nil
    end

    it "uses the given department over the user's" do
      authors = [ OpenStruct.new(department: :web) ]
      article = factory.call params.merge(authors: authors)
      expect(article.department).to be_eql params[:department]
    end
  end

  context "wihout an author" do end

end
