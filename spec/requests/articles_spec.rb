require "rails_helper"

RSpec.describe "Articles" do
  context "accessing articles" do
    it "index" do
      article1 = create(:article)
      article2 = create(:article, :publish_date => DateTime.now - 2.weeks)
      article3 = create(:article, :publish_date => DateTime.now + 1.week)

      get root_path

      expect(page).to have_content(
    end
  end
end
