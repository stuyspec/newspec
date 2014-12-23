require 'rails_helper'

describe Year do
  subject { build(:year) }
  context "being created" do
    it { is_expected.to be_valid }
    it { is_expected.to be_invalid_without :year }
  end
end
