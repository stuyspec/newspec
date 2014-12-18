require 'rails_helper'

RSpec::Matchers.define :be_able_to do |action|
  match do |entity|
    entity.can? action
  end
  description do
    "be permitted to #{action}"
  end
end
