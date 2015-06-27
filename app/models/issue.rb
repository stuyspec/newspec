require 'forwardable'
class Issue
  extend Forwardable
  def_delegators :num, :<=>
  def initialize(num)
    @num = num.to_i
  end
end
