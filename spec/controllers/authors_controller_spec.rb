require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do

  describe "GET #index" do
    it "assigns all the authors as @author" do
      authors = [
        create(:author, first: "Jake", last: "Waksbaum"),
        create(:author, first: "Ari", last: "Hatzimemos")
      ]
      get :index
      expect(assigns(:authors)).to eq(authors)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      author = create(:author, first: "Kerry", last: "Garfinkel")
      authors = [
        author,
        create(:author, first: "Jake", last: "Waksbaum"),
        create(:author, first: "Ari", last: "Hatzimemos")
      ]
      get :show, id: author.id
      expect(assigns(:author)).to eq(author)
    end
  end

end
