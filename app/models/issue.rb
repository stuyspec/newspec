# == Schema Information
#
# Table name: issues
#
#  id           :integer          not null, primary key
#  number       :integer
#  publish_date :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Issue < ActiveRecord::Base
  has_many :articles
  validates :number, presence: true, uniqueness: true #{scope: :year, message: "is unique within a year"}
  after_initialize :setup

  self.alt_name :number, :num
  self.alt_name :publish_date, :date
  self.make_has :number, :publish_date

  def self.current
    Issue.where("done = :false AND publish_date > :now", now: Time.now, false: false).order(:publish_date => :asc).first
  end

  private
  def setup
    if self.new_record?
      auto_number unless has_number?
      auto_publish_date unless has_publish_date?
    end
  end

  def auto_number
    prev = Issue.select(:number).order(:number => :asc).last
    self.number = prev.nil? ? 1 : prev.number+1
  end

  def auto_publish_date
    prev = Issue.select(:publish_date, :number).where("number < ?", self.number).order(:number => :asc).last
    self.publish_date = prev.nil? ? Time.now : prev.publish_date
    self.publish_date += 1.month
  end
end
