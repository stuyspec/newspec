require 'rails_helper'

describe Department do
  subject { build(:department) }

  context "being created" do
    it { is_expected.to be_valid }
    it { is_expected.to be_invalid_without :name }
    it { is_expected.to be_invalid_with_duplicate :name }
    it { is_expected.not_to be_invalid_without :editor }
    it "can have an editor" do
      expect{subject.editor = build(:editor) }.not_to change{ subject.valid? }.from(true)
    end
  end

end
