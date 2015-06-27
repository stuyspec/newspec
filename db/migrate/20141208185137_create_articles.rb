class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :status
      t.datetime :publish_date
      t.text :text, default: '', null: false
      t.string :slug, index: true, unique: true

      t.timestamps
    end
  end
end
