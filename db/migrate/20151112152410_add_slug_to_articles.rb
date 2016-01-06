class AddSlugToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :slug, :string
    Article.connection.execute("""
                               ALTER TABLE articles
                               ADD UNIQUE (issue_num, year, slug);
                               """)
    Article.all.each do |article|
      article.slug = Article.slug_for(article)
      article.save
    end
    change_column_null :articles, :slug, false
  end
end
