require_relative 'scripted_proc.rb'

RSpec.describe ScriptedProc do
  it 'returns elements of list in order' do
    sp = ScriptedProc.new [1, 2, 9, -1]
    expect(sp.call).to eq 1
    expect(sp.call).to eq 2
    expect(sp.call).to eq 9
    expect(sp.call).to eq(-1)
  end

  it 'continues to return last element' do
    sp = ScriptedProc.new [1]
    expect(sp.call).to eq 1
  end

  it 'works with infinite enumarators' do
    inf = Enumerator.new do |yielder|
      n = 0
      loop do
        yielder.yield n
        n += 1
      end
    end
    sp = ScriptedProc.new inf
    expect(sp.call).to eq 0
    expect(sp.call).to eq 1
    expect(sp.call).to eq 2
    expect(sp.call).to eq 3
    50.times { sp.call }
    expect(sp.call).to eq 54
  end
end
