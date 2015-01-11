# == Schema Information
#
# Table name: articles
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  author_id     :integer
#  status        :string(255)
#  publish_date  :datetime
#  created_at    :datetime
#  updated_at    :datetime
#  department_id :integer
#  issue_id      :integer
#

class Article < ActiveRecord::Base
  # Associations
  belongs_to :author, class_name: "Profile"
  belongs_to :issue
  belongs_to :department
  has_one :user, through: :author
  delegate :year, to: :issue

  # Validations
  validates :status, inclusion: {in: %i(draft editor eic pending published)}
  validates :author, presence: true
  validates :title, presence: true, length: {maximum: 50}
  validates :issue, presence: true
  validates :publish_date, presence: true

  # Lifecycle Callbacks
  after_initialize :setup, if: :new_record?

  private

  def setup
    auto_issue unless issue.present?
    auto_publish_date unless publish_date.present? or not issue.present?
    auto_department unless department.present? or not user.present?
    auto_status unless status.present?
  end

  def auto_issue
    self.issue = Issue.current
  end

  def auto_publish_date
    self.publish_date = issue.publish_date
  end

  def auto_department
    self.department = user.department
  end

  def auto_status
    self.status = :draft
  end
end
