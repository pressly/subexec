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
      assert_equal sub.exitstatus, nil
    end
    
  end
  
end

