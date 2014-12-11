class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.belongs_to :author, index: true
      t.string :status
      t.datetime :publish_date

      t.timestamps
    end
  end
end
