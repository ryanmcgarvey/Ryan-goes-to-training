require 'rubygems'
require 'test/unit'
require 'shoulda'

#START:code
class ProcrastinatingTest < Test::Unit::TestCase
  context "Something that needs to be tested" do
    should "have a feature"
    should "have another feature"
    should "do good things"    
  end
end
#END:code