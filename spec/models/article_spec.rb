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
end
