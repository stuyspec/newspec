json.array!(@profiles) do |profile|
  json.extract! profile, :id, :first, :last, :email
  json.url profile_url(profile, format: :json)
end
