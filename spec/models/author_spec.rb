require 'rails_helper'

RSpec.describe Author, type: :model do

  describe ".is_unique_slug" do

    it "is true when slug is untaken" do
      create(:author, first: "Jake", last: "Waksbaum", slug: "AHHAHAHA")
      expect(Author.is_unique_slug("jake-waksbaum")).to be true
    end

    it "is false when slug is taken" do
      create(:author, first: "foo", last: "blah", slug: "jake-waksbaum")
      expect(Author.is_unique_slug("jake-waksbaum")).to be false
    end

  end

end
