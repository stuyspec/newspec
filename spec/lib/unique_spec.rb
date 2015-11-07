require_relative '../../lib/unique.rb'

RSpec.describe Unique do
  it "returns the plain slug if untaken" do
    unique = Unique.new { true }
    expect(unique.call("my-term")).to eql("my-term")
  end

  it "appends a number if taken" do
    unique = Unique.new &ScriptedProc.new([false, true])
    expect(unique.call("my-term")).to eql("my-term-1")
  end

  it "increases the appended number until unique" do
    unique = Unique.new &ScriptedProc.new([false, false, false, false, true])
    expect(unique.call("my-term")).to eql("my-term-4")
  end
end
