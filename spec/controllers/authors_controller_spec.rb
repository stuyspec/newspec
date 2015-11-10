require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do

  describe "GET #by_year" do
    it "assigns all the authors as @authors" do
      authors = [
        build(:author, first: "Jake", last: "Waksbaum"),
        build(:author, first: "Ari", last: "Hatzimemos")
      ]
      get :index
      expect(assigns(:authors)).to eq(authors)
    end
  end

  describe "GET #show" do
    it "assigns the author as @author" do
      author = create(:author, first: "Kerry", last: "Garfinkel")
      authors = [
        author,
        create(:author, first: "Jake", last: "Waksbaum"),
        create(:author, first: "Ari", last: "Hatzimemos")
      ]
      get :show, slug: author.slug
      expect(assigns(:author)).to eq(author)
    end
  end

end
