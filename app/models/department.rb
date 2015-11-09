class Department < ActiveRecord::Base
  has_many :articles
end
