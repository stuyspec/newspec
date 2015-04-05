# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  first      :string(255)
#  last       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Profile < ActiveRecord::Base
  # Associations
  has_one :user
  has_and_belongs_to_many :articles, foreign_key: :author_id

  def name
    "#{first.capitalize} #{last.capitalize}"
  end

  def to_s
    name
  end
end
