class CreateArticlesProfiles < ActiveRecord::Migration
  def change
    create_table :articles_profiles, id: false do |t|
      t.belongs_to :profile, index: true
      t.belongs_to :article, index: true
    end
  end
end
