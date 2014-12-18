require 'rails_helper'

describe Article do
  context "being created" do
    subject { build(:article) }

    it { is_expected.to be_valid }
    it { is_expected.to be_invalid_without :author }
    it { is_expected.to be_invalid_without :title }
    it { is_expected.to be_invalid_without :issue }
    it { is_expected.to be_invalid_without :publish_date }
    it { is_expected.not_to be_invalid_without :department }

  end

end
