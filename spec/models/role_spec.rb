# == Schema Information
#
# Table name: roles
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  capabilities :string(255)      default([]), is an Array
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Role, :type => :model do
  subject { create(:role) }

  context "being created" do

    it { is_expected.to be_valid }
    it { is_expected.to be_invalid_without :name }
    it { is_expected.to be_invalid_with_duplicate :name }

  end

  describe "#can?" do
    subject { build(:writer) }

    it { is_expected.to be_able_to :write }
    it { is_expected.not_to be_able_to :delete }

  end
end
