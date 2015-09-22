json.articles @articles do |article|
  json.id    article.id
  json.title article.title
  json.url   UrlFor.call(article)
end
  #json.authors article
