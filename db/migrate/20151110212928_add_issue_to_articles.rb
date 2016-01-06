class AddIssueToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :issue_num, :integer, index: true, null: false
    add_column :articles, :year, :integer, index: true, null: false
  end
end
