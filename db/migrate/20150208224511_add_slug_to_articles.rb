cl
ass AddSlugToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :slug, :string, :index => true, :unique => true
  end
end
