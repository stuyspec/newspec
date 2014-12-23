class Settings::DefaultRole < Settings
  belongs_to :role, foreign_key: :value

  def self.get
    first || create!(role: Role.create!(name: "Writer", caps: []))
  end

end
