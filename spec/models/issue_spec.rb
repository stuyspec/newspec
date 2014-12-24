# == Schema Information
#
# Table name: issues
#
#  id           :integer          not null, primary key
#  number       :integer
#  publish_date :datetime
#  done         :boolean          default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#  year_id      :integer
#

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
