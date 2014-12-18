
require 'rails_helper'

RSpec::Matchers.define :be_invalid_without do |attr|
  match do |entity|
    change{ subject.valid? }.from(true).to(false).matches?( lambda{ entity.send "#{attr}=", nil }  )
  end

  failure_message do |actual|
    "expected to be invalid when #{attr} is nil"
  end

  failure_message_when_negated do |actual|
    "expected to be valid when #{attr} is nil"
  end

  description do
    "be invalid without #{attr}"
  end
end
