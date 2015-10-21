class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      #t.string :slug,  null: false
      t.text :text
      t.datetime :publish_date

      t.timestamps null: false
    end
  end
end
