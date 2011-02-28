require 'rubygems'
require 'shoulda'

begin
  require 'ruby-debug'
rescue LoadError
end

require File.join(File.dirname(__FILE__), 'loader')

#
class Test::Unit::TestCase
end
