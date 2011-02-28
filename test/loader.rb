ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))
TEST_ROOT = File.join(ROOT, 'test')

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(File.dirname(__FILE__))
require 'subexec'

# Test program
TEST_PROG = File.join(TEST_ROOT, 'helloworld.sh')