require 'spec_helper'

RSpec::describe Issue, :type => :model do
  context "given a number" do
    subject { Issue.new(1) }


  end

  it { is_expected.to be_valid }
  it { is_expected.to be_invalid_without :number }

  it "cannot have duplicate numbers within a year" do
    is_expected.to be_invalid_with_duplicate :number, :year_id
  end

  it "can have duplicate numbers in different years" do
    is_expected.not_to be_invalid_with_duplicate :number
  end

end
