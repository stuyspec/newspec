# == Schema Information
#
# Table name: articles
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  author_id     :integer
#  publish_date  :datetime
#  created_at    :datetime
#  updated_at    :datetime
#  department_id :integer
#  issue_id      :integer
#  status        :string(255)      default("draft")
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "creates an article" do
    assert Article.create title: "godzilla", author: profiles(:jake)
  end

  test "article inherits publish_date from issue" do
    a = Article.create title: "godzilla attacks", author: profiles(:jake), issue: issues(:one)
    assert_equal a.publish_date, issues(:one).publish_date
  end
end
