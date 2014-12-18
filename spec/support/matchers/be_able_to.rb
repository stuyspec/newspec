require 'rails_helper'

RSpec::Matchers.define :be_able_to do |action|
  match do |user|
    user.can? action
  end
  description do
    "be permitted to #{action}"
  end
end
