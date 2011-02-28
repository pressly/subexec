$LOAD_PATH << File.dirname(__FILE__)
require 'helper'

class SubexecTest < Test::Unit::TestCase
  context "Subexec class" do
    
    should "run helloworld script" do
      sub = Subexec.run "#{TEST_PROG} 1"
      assert_equal sub.output, "Hello\nWorld\n"
      assert_equal sub.exitstatus, 0
    end
    
    should "timeout helloworld script" do
      sub = Subexec.run "#{TEST_PROG} 2", :timeout => 1
      if RUBY_VERSION >= '1.9'
        assert_equal sub.exitstatus, nil
      else
        # Ruby 1.8 doesn't support the timeout, so the
        # subprocess will have to exit on its own
        assert_equal sub.exitstatus, 0
      end
    end
    
    should "set LANG env variable on request" do
      original_lang = `echo $LANG`

      sub = Subexec.run "echo $LANG", :lang => "fr_FR.UTF-8"
      assert_equal sub.output, "fr_FR.UTF-8\n"
      sub = Subexec.run "echo $LANG", :lang => "C"
      assert_equal sub.output, "C\n"
      sub = Subexec.run "echo $LANG", :lang => "en_US.UTF-8"
      assert_equal sub.output, "en_US.UTF-8\n"
      
      assert_equal `echo $LANG`, original_lang
    end
    
    should "default LANG to C" do
      sub = Subexec.run "echo $LANG"
      assert_equal sub.output, "C\n"
    end
    
  end
  
end

