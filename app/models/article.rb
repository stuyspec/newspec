class Article < ActiveRecord::Base
  belongs_to :author, class_name: "Profile"
  validates :status, inclusion: {in: %w(draft editor eic pending published)}
end
