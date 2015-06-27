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
  has_many :users, through: :authors

  # Validations
  validates :status, inclusion: {in: %w(draft editor eic pending published)}
  validates_presence_of :publish_date, :issue, :year
  validates :authors, length: {minimum: 1}
  validates :title, presence: true

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

  private

  def setup
    auto_publish_date unless publish_date.present? or not issue.present?
    auto_department unless department.present? or not users.present?
  end

  def auto_publish_date
    self.publish_date = issue.publish_date
  end

  def auto_department
    self.department = users[0].department
  end

end
