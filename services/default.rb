require_relative 'service'
class Default
  def initialize(db, now=DateTime.now)
    @db = db
    @now = now
  end

  def issue
    @db[:default_issue] = 1 unless @db.has_key? :default_issue
    @db[:default_issue]
  end

  def year
    @db[:default_year] = @now.year unless @db.has_key? :default_year
    @db[:default_year]
  end

  def status
    :draft
  end

end
