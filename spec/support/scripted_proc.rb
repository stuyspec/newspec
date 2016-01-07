# A calleable object that returns values in order
# from the Enumerable it is initialized with.
# It continues to return the last item if it reaches the end.
class ScriptedProc < SimpleDelegator
  def initialize(script)
    enum = script.each
    p = proc do
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
