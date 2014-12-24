# == Schema Information
#
# Table name: settings
#
#  id         :integer          not null, primary key
#  type       :string(255)      not null
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Settings::DefaultRole < Settings
  belongs_to :role, foreign_key: :value

  def self.get
    first || create!(role: Role.create!(name: "Writer", caps: []))
  end

end
