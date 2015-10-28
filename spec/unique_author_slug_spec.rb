require_relative "../lib/unique_author_slug.rb"
require_relative "../app/models/author.rb"

RSpec.describe UniqueAuthorSlug do

  it "returns the plain slug if untaken" do
    author = double(:author, name: "Jake Waksbaum")
    allow(Author).to receive(:is_unique_slug).and_return true
    slug = UniqueAuthorSlug.call(author)
    expect(slug).to eql("jake-waksbaum")
  end

  it "appends a number if taken" do
    author = double(:author, name: "Jake Waksbaum")
    allow(Author).to receive(:is_unique_slug).and_return(false, true)
    slug = UniqueAuthorSlug.call(author)
    expect(slug).to eql("jake-waksbaum-1")
  end

  it "increases the appended number until unique" do
    author = double(:author, name: "Jake Waksbaum")
    allow(Author).to receive(:is_unique_slug).and_return(false, false, false, false, true)
    slug = UniqueAuthorSlug.call(author)
    expect(slug).to eql("jake-waksbaum-4")
  end
end
