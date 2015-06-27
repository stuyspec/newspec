module Service
  def self.included
    def self.call(*args)
      new(*args).call
    end
  end
end
