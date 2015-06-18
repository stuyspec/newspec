require 'spec_helper'
require_relative '../../services/create_article'

describe CreateArticle do
  subject { CreateArticle.new(new_article, defaults) }
  let(:defaults) { OpenStruct.new(issue: 1, year: 2015, status: :draft) }
  let(:new_article) do
    double().tap do |d|
      expect(d).to receive(:call).and_return( OpenStruct.new )
    end
  end
  let(:params) { Hash.new title: "Cool new article", issue: 3, year: 2015, status: :published }


  it "passes on given parameters" do
    subject.call params
  end

  it "provides issue" do
    a = subject.call params.except(:issue)
    expect(a.issue).to be_eql 1
  end

  it "provides year" do
    a = subject.call params.except(:year)
    expect(a.year).to be_eql 2015
  end

  it "provides status" do
    a = subject.call params.except(:status)
    expect(a.status).to be_eql :draft
  end
end
