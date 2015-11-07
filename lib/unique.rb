# Ensures a term is unique
class Unique
  def initialize(&unique)
    @unique = unique
  end

  def call(term)
    if @unique.call(term)
      term
    else
      n = 0
      begin
        n += 1
        numbered_term = append_n(term, n)
      end until @unique.call(numbered_term)
      numbered_term
    end
  end

  def append_n(term, n)
    "#{term}-#{n}"
  end
end
