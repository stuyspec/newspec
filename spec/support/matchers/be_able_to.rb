require 'rails_helper'

RSpec::Matchers.define :be_able_to do |action|
  match do |entity|
    entity.can? action
  end

  failure_message do |actual|
    "expected to have permissions to #{action}"
  end

  failure_message_when_negated do |actual|
    "expected to not have permissions to #{action}"
  end

  description do
    "be permitted to #{action}"
  end
end
