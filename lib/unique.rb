# Ensures a term is unique
class Unique
  def initialize(&unique)
    @unique = unique
  end

  def call(term)
    if @unique.call(term)
      term
    else
      generate_unique term
    end
  end

  private

  def generate_unique(term)
    n = 0
    loop do
      n += 1
      numbered_term = append_n(term, n)
      return numbered_term if @unique.call(numbered_term)
    end
  end

  def append_n(term, n)
    "#{term}-#{n}"
  end
end
