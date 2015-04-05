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
  scope :published, -> { where(status: :published) }
  # Associations
  has_and_belongs_to_many :authors, class_name: "Profile"
  belongs_to :issue
  belongs_to :department
  has_one :user, through: :author
  has_one :year, through: :issue

  # Validations
  validates :status, inclusion: {in: %w(draft editor eic pending published)}
  validates_presence_of :issue, :publish_date
  validates :authors, length: {minimum: 1}
  validates :title, presence: true, length: {maximum: 50}

  # Lifecycle Callbacks
  after_initialize :setup, if: :new_record?

  # FriendlyId for Slugs
  extend FriendlyId
  friendly_id :title, :use => :scoped, :scope => :issue

  def should_generate_new_friendly_id?
    (title_changed? and not published?) or super
  end

  # stop from changing slug if published
  def slug=(slug)
    super unless self.published?
  end

  def published?
    status == :published
  end

  def has_thumbnail?
    false
  end

  def formatted_date
    now = Time.now
    range = now-1.day..now
    if range.cover? publish_date
      hours = (now - publish_date).to_i / 1.hour
      "#{hours} #{'hour'.pluralize(hours)} ago"
    else
      publish_date.strftime("%B %-d, %Y")
    end
  end

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
    self.status = "draft"
  end
end
