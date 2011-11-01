require 'spec_helper'

describe Subexec do
  context 'Subexec class' do
    
    # it 'run helloworld script' do
    #   sub = Subexec.run "#{TEST_PROG} 1"
    #   sub.output.should == "Hello\nWorld\n"
    #   sub.exitstatus.should == 0
    # end
    # 
    # it 'timeout helloworld script' do
    #   sub = Subexec.run "#{TEST_PROG} 2", :timeout => 1
    #   if RUBY_VERSION >= '1.9'
    #     sub.exitstatus.should == nil
    #   else
    #     # Ruby 1.8 doesn't support the timeout, so the
    #     # subprocess will have to exit on its own
    #     sub.exitstatus.should == 0
    #   end
    # end
    # 
    # it 'set LANG env variable on request' do
    #   original_lang = `echo $LANG`
    # 
    #   sub = Subexec.run "echo $LANG", :lang => "fr_FR.UTF-8"
    #   sub.output.should == "fr_FR.UTF-8\n"
    #   sub = Subexec.run "echo $LANG", :lang => "C"
    #   sub.output.should == "C\n"
    #   sub = Subexec.run "echo $LANG", :lang => "en_US.UTF-8"
    #   sub.output.should == "en_US.UTF-8\n"
    #   
    #   `echo $LANG`.should == original_lang
    # end
    # 
    # it 'default LANG to C' do
    #   sub = Subexec.run "echo $LANG"
    #   sub.output.should == "C\n"
    # end

    it 'can pass a log_file' do
      require 'tempfile'
      log_file = Tempfile.new('foo')
      
      sub = Subexec.run "#{TEST_PROG} 1", :log_file => log_file.path
      sub.output.should == ''
      sub.exitstatus.should == 0
      
      log_file.read.should == "Hello\nWorld\n"
      log_file.close
      log_file.unlink
    end
    
  end  
end
