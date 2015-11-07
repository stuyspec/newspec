require 'rails_helper'

RSpec.describe Author, type: :model do

  describe ".create_author" do
    it "creates an author when slug is untaken" do
      Author.create_author("Jake", "Waksbaum")
    end

    it "creates an author when the slug is taken" do
      2.times do
        Author.create_author("Jake", "Waksbaum")
      end
    end
  end

end
