require 'rails_helper'

RSpec.describe Issue, :type => :model do
  subject { create(:issue) }

  context "being created" do

    it { is_expected.to be_valid }
    it { is_expected.to be_invalid_without :number }

    it "cannot have duplicate numbers within a year" do
      is_expected.to be_invalid_with_duplicate :number, :year_id
    end

    it "can have duplicate numbers in different years" do
      is_expected.not_to be_invalid_with_duplicate :number
    end

  end

end
