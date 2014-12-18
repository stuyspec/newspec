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

class Article < ActiveRecord::Base
  belongs_to :author, class_name: "Profile"
  belongs_to :issue
  belongs_to :department
  validates :status, inclusion: {in: %w(draft editor eic pending published)}
  validates :author, presence: true
  validates :title, presence: true, length: {maximum: 50}
  validates :issue, presence: true
  validates :publish_date, presence: true
  after_initialize :setup, if: :new_record?

  self.make_has :author, :issue, :publish_date, :department

  private
  def setup
    auto_issue unless self.has_issue?
    auto_publish_date unless self.has_publish_date? or not has_issue?
    auto_department unless self.has_department? or not has_author?
  end

  def auto_issue
    self.issue = Issue.current
  end

  def auto_publish_date
    self.publish_date = self.issue.publish_date unless self.issue.publish_date.nil?
  end

  def auto_department
    a = self.author.user
    self.department = a.department unless a.nil?
  end
end
