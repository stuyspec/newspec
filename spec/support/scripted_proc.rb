class ScriptedProc < SimpleDelegator
  def initialize(script)
    enum = script.each
    p = Proc.new do
      last = nil
      begin
        last = enum.next
      rescue StopIteration
        last
      end
    end
    __setobj__(p)
  end
end

