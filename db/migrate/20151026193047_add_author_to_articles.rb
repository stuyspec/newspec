class AddAuthorToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :author, index: true
    add_foreign_key :articles, :authors, on_change: :update, on_delete: :restrict
  end
end
