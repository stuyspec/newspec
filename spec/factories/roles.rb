FactoryGirl.define do

  factory :role, aliases: [:admin] do

    name "admin"
    capabilities ["read", "write", "delete"]
  end

  factory :writer, class: Role do
    name "writer"
    capabilities ["write"]
  end

end
