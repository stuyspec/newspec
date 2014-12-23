class Settings < ActiveRecord::Base
  validates :type, presence: true, uniqueness: true
  validates :value, presence: true
end
