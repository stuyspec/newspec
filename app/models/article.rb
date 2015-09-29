class Article < ActiveRecord::Base
  def self.published
    where("publish_date <= ?", DateTime.now)
  end
end
