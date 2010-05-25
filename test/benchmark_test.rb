require 'helper'
require 'benchmark'

class BenchmarkTest < Test::Unit::TestCase
  
  context "benchmarks" do
    should "run benchmarks" do
      
      n = 100
      Benchmark.bm(20) do |x|
        x.report("via Subexec x#{n}") do
          n.times do
            sub = Subexec.run "#{TEST_PROG} 0", :timeout => 2
            raise if sub.output != "Hello\nWorld\n"
          end
        end

        x.report("via `` x#{n}") do
          n.times do
            output = `#{TEST_PROG} 0`
            raise if output != "Hello\nWorld\n"
          end
        end
      end
      
    end
  end
  
end
