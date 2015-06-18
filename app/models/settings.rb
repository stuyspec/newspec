class Settings < ActiveRecord::Base
  self.primary_key = :key

  # Validations
  validates :key, presence: true, uniqueness: true
  validates :value, presence: true

  class << self
    def [](key)
      key = key.to_sym
      it = where(key: key)
      if it.count > 0
        it.first.value
      else
        nil
      end
    end

    def []=(key, value)
      key = key.to_sym
      it = where(key: key)
      if it.exists?
        update(key, value: value)
      else
        create(key: key, value: value)
      end
    end

    def merge(h)
      h.each do |k, v|
        send("[]=", k.to_sym, v)
      end
    end

    def has_key?(key)
      exists? key.to_sym
    end
  end

end
