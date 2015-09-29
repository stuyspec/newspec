class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      #t.string :slug,  null: false
      t.text :text, null: false
      t.datetime :publish_date, null: false

      t.timestamps null: false
    end
  end
end
