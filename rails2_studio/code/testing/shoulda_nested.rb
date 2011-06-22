require 'rubygems'
require 'test/unit'
require 'shoulda'

#START:nested
class NestedContextsTest < Test::Unit::TestCase
  context "Outer" do
    setup do
      STDERR.puts "In outer context"
    end

    should "cause the outer setup to run" do
      STDERR.puts "outer should"
    end

    context "Inner" do
      setup do
        STDERR.puts "In inner context"
      end
      should "cause the outer and inner setups to run" do
        STDERR.puts "first inner should"
      end
      should "also cause the outer and inner setups to run" do
        STDERR.puts "second inner should"        
      end
    end
  end
end
#END:nested