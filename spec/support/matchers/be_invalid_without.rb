require 'rails_helper'

RSpec::Matchers.define :be_invalid_without do |attr|
  match do |entity|
    change{ entity.valid? }.from(true).to(false).matches?( lambda{ entity.send "#{attr}=", nil }  )
  end

  failure_message do |actual|
    "expected to be invalid without #{attr}, but was valid"
  end

  failure_message_when_negated do |actual|
    "expected to be valid without #{attr} but was invalid"
  end

  description do
    "be invalid without #{attr}"
  end
end
