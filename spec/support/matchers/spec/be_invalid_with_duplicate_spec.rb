require "spec_helper"
require_relative 'cat'
require_relative '../be_invalid_with_duplicate.rb'

RSpec::describe :be_invalid_with_duplicate, custom_matcher: true do
  subject { Cat.create name: 'jake', age: 4}
  it { is_expected.to be_invalid_with_duplicate :name }
  it { is_expected.to be_invalid_with_duplicate :name, :age }
  it { is_expected.to_not be_invalid_with_duplicate :age }
  it { is_expected.to_not be_invalid_with_duplicate :age, name: 'joe' }
end

