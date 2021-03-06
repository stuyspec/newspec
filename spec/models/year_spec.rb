# == Schema Information
#
# Table name: years
#
#  id         :integer          not null, primary key
#  year       :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Year, :type => :model do
  subject { create(:year) }

  context "being created" do
    it { is_expected.to be_valid }
    it { is_expected.to be_invalid_without :year }
    it { is_expected.to be_invalid_with_duplicate :year }
  end

end
