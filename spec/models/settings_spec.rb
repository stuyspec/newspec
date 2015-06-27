require 'spec_helper'
require_relative '../../app/models/settings'

RSpec::describe Settings, :new do
  before do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.start
  end

  after do
    DatabaseCleaner.clean
  end

  describe ".[]" do
    it "returns nil if the entry doesn't exist" do
      expect(Settings["foo"]).to be_nil
    end

    it "returns the correct value" do
      Settings.create(key: "foo", value: "bar")
      expect(Settings["foo"]).to be_eql("bar")
    end
  end

  describe ".[]=" do
    it "creates a new entry" do
      Settings["foo"] = "bar"
      expect(Settings.find("foo").value).to be_eql("bar")
    end

    it "overwrites an existing entry" do
      Settings.create(key: "foo", value: "bar")
      Settings["foo"] = "jar"
      expect(Settings.find("foo").value).to be_eql("jar")
    end
  end

end
