require 'rubygems'
require 'shoulda'

begin
  require 'ruby-debug'
rescue LoadError
end

ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))
TEST_ROOT = File.join(ROOT, 'test')

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(File.dirname(__FILE__))
require 'subexec'

# Test program
TEST_PROG = File.join(TEST_ROOT, 'helloworld.sh')

#
class Test::Unit::TestCase
end
