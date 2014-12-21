require "rails_helper"

RSpec::Matchers.define :be_invalid_with_duplicate do |attr, other_attrs={}|
  match do |entity|
    dup = entity.class.new other_attrs.merge( attr => entity.send(attr) )
    return dup.valid?
  end

  failure_message do |actual|
    "expected to be invalid with duplicate #{attr}, but was still valid"
  end

  failure_message_when_negated do |actual|
    "expected to be valid with duplicate #{attr}, but was invalid"
  end

  description do
    "be invalid with duplicate #{attr}"
  end
end
