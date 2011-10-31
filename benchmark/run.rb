begin
  require 'bundler'
  Bundler.setup(:default, :development)
rescue LoadError => e
  # Fall back on doing an unlocked resolve at runtime.
  $stderr.puts e.message
  $stderr.puts "Try running `bundle install`"
  exit!
end

require 'benchmark'

TEST_PROG = File.join(File.expand_path('../spec', File.dirname(__FILE__)), 'helloworld.sh')

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
