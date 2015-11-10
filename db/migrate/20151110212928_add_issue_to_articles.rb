class AddIssueToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :issue_num, :integer, index: true
    add_column :articles, :year, :integer, index: true
  end
end
