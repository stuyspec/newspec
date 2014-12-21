require 'rails_helper'

describe Issue do
  subject { build(:issue) }

  context "being created" do
    it { is_expected.to be_valid }
    it { is_expected.to be_invalid_without :number}
    it { is_expected.to be_invalid_with_duplicate :number }
  end
end
