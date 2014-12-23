class Year < ActiveRecord::Base
  has_many :issues
  validates :year, presence: true, uniqueness: true
end
