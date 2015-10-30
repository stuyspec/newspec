class AddIndexToAuthorSlug < ActiveRecord::Migration
  def change
    add_index :authors, :slug, :unique => true
  end
end
