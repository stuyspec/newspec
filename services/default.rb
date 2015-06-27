require_relative 'service'
class Default
  FALLBACK_BASE = {issue: 1, status: :draft}

  def initialize(db, now=DateTime.now)
    @db = db
    @fallback = FALLBACK_BASE.merge year: now.year, publish_date: now + 2.weeks
  end

  %i(issue year status publish_date).each do |attr|
    define_method attr do
      key = "default_#{attr}".to_sym
      @db[key] = @fallback[key] unless @db.has_key? key
      @db[key]
    end
  end

end
