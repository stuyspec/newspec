class UniqueAuthorSlug
  class << self

    def call(author)
      slug = author.name.parameterize
      if Author.is_unique_slug(slug)
        slug
      else
        append_until_unique(slug)
      end
    end

    def append_until_unique(slug)
      n = 0
      begin
        n += 1
        numbered_slug = append_n(slug, n)
      end until Author.is_unique_slug(numbered_slug)

      return numbered_slug
    end

    def append_n(slug, n)
      "#{slug}-#{n}"
    end

  end
end
