class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :number
      t.datetime :publish_date
      t.boolean :done, default: false

      t.timestamps
    end

    change_table :articles do |t|
      t.belongs_to :issue
    end
  end
end
