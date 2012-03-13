begin
  require 'bundler'
  Bundler.setup(:default, :development)
rescue LoadError => e
  # Fall back on doing an unlocked resolve at runtime.
  $stderr.puts e.message
  $stderr.puts "Try running `bundle install`"
  exit!
end

$:.unshift(File.dirname(__FILE__))
$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

begin
  require 'ruby-debug'
rescue LoadError
end

require 'subexec'
require 'rspec'

RSpec.configure do |config|
  config.mock_with :rspec
end

TEST_PROG = File.join(File.dirname(__FILE__), 'helloworld.sh')
