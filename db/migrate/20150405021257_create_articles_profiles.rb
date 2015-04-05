class CreateArticlesProfiles < ActiveRecord::Migration
  def change
    create_table :articles_profiles, id: false do |t|
      t.belongs_to :profile, index: true
      t.belongs_to :article, index: true
    end

    remove_index :articles, column: :author_id
    remove_column :articles, :author_id, :integer

  end
end
