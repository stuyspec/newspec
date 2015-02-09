class ChangeTextToTextForArticles < ActiveRecord::Migration
  def self.up
    change_column :articles, :text, :text
  end

  def self.down
    change_column :articles, :text, :string
  end
end
