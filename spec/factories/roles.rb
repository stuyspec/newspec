FactoryGirl.define do

  factory :role, aliases: [:admin, :default_role] do

    name "admin"
    capabilities ["read", "write", "delete"]
    default true
  end

  factory :writer, class: Role do
    name "writer"
    capabilities ["write"]
  end

end
