require "rails_helper"

RSpec::Matchers.define :be_invalid_with_duplicate do | *attrs |

  if attrs.last.is_a? Hash # TODO fix arguments this is hacky
    other_attrs = attrs.last
    dup_attrs = attrs[0...-1]
  else
    other_attrs = {}
    dup_attrs = attrs
  end

  match do |entity|
    dup_attrs = [dup_attrs] unless dup_attrs.is_a? Array
    dup_attrs_hash = {}
    dup_attrs.each {|dup_attr| dup_attrs_hash[dup_attr] = entity.send(dup_attr) }

    dup = entity.class.new other_attrs.merge(dup_attrs_hash)
    dup.invalid?
  end

  failure_message do |actual|
    "expected to be invalid with duplicate #{list_ar dup_attrs}, but was still valid"
  end

  failure_message_when_negated do |actual|
    "expected to be valid with duplicate #{list_ar dup_attrs}, but was invalid"
  end

  description do
    "be invalid with duplicate #{list_ar dup_attrs}"
  end
end

def list_ar words
  if words.size == 1
    words[0]
  else
    "#{words[0...-1].join(", ")}, and #{words[-1]}"
  end
end
