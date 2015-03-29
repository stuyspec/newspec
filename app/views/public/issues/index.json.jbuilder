json.array!(@issues) do |issue|
  json.extract! issue, :id, :number, :publish_date
  json.url issue_url(issue, format: :json)
end
