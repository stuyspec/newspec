# == Schema Information
#
# Table name: issues
#
#  id           :integer          not null, primary key
#  number       :integer
#  publish_date :datetime
#  done         :boolean          default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#  year_id      :integer
#

class Issue < ActiveRecord::Base
  # Associations
  has_many :articles
  belongs_to :year

  # Validations
  validates :number, presence: true, uniqueness: {scope: :year, message: "is unique within a year"}

  # Lifecycle Callbacks
  after_initialize :setup, if: :new_record?

  # Alternate Names (Sugar)
  { :num => :number, :date => :publish_date}.each { |new, old| alias_attribute new, old }

  def self.current
    Issue.where("done = :false AND publish_date > :now", now: Time.now, false: false).order(:publish_date => :asc).first
  end

  private

  def setup
    auto_number unless number.present?
    auto_publish_date unless publish_date.present?
  end

  def auto_number
    prev = Issue.select(:number).order(:number => :asc).last
    self.number = if prev.nil? then 1 else prev.number + 1 end
  end

  def auto_publish_date
    prev = Issue.select(:publish_date, :number).where("number < ?", self.number).order(:number => :asc).last
    self.publish_date = if prev.nil? then Time.now else prev.publish_date end
    self.publish_date += 1.month
  end
end
