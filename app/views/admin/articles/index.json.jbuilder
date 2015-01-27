json.array!(@articles) do |article|
  json.extract! article, :id, :title, :author, :status, :publish_date
  json.url article_url(article, format: :json)
end
