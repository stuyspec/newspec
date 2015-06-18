require 'spec_helper'
require 'ostruct'
require_relative '../../services/default'

describe Default do
  let(:db) { Hash.new }
  let(:default) { Default.new db, OpenStruct.new(year: 2015) }

  describe ".issues" do
    it "creates a default issue" do
      expect(db).to receive(:'[]=').with(:default_issue, 1)
      default.issue
    end

    it "gets the issue" do
      db[:default_issue] = 4
      expect(default.issue).to be_eql 4
    end
  end

  describe ".year" do

    it "creates a default year" do
      expect(db).to receive(:'[]=').with(:default_year, 2015)
      default.year
    end

    it "gets the year" do
      db[:default_year] = 2016
      expect(default.year).to be_eql(2016)
    end
  end
end
