json.array!(@years) do |year|
  json.extract! year, :id, :number
  json.url year_url(year, format: :json)
end
