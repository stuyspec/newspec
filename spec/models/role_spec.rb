require 'rails_helper'

describe Role do
  context "being created" do
    subject { build(:role) }

    it { is_expected.to be_valid }

    it "is invalid without a name" do
      expect { subject.name = nil }.to change{ subject.valid? }.from(true).to(false)
    end

  end

  describe "#can?" do
    subject { build(:writer) }

    it { is_expected.to be_able_to "write"}
    it { is_expected.not_to be_able_to 'delete' }
  end
end
