# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  editor_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Department, :type => :model do
  subject { create(:department) }

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
