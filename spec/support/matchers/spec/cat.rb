class Cat
  include Comparable
  @@all = []
  @@uniques = [:name]
  @@last_id = 1
  attr_accessor :name, :age
  attr_reader :id

  def initialize attrs
    attrs.each {|k,v| self.instance_variable_set("@#{k}", v) }
  end

  def self.create attrs
    c = self.new attrs
    c.save
  end

  def save
    if @id.nil?
      @id = @@last_id
      @@last_id += 1
    end
    if valid?
      @@all.delete self
      @@all << self.dup
    end
    return self
  end

  def self.all
    @@all
  end

  def valid?
    @@all.select{|other| other.id != self.id }.each do |other|
      @@uniques.each do |attr|
        return false if other.instance_variable_get("@#{attr}") == self.instance_variable_get("@#{attr}")
      end
    end
    return true
  end

  def <=>(other)
    self.id.<=> other.id
  end

  def invalid?
    not valid?
  end
end
