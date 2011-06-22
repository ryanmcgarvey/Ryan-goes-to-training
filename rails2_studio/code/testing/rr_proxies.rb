require 'test/unit'
require 'shoulda'
require 'rr'

class Person
  def initialize(first, last)
    @first = first
    @last = last
  end
  
  def full_name
    [@first, @last].join(" ")
  end
end

#START:rr
class RRExampleTest < Test::Unit::TestCase
  include RR::Adapters::TestUnit
  
  context "RR" do
    setup do
      @person = Person.new("Yukihiro", "Matz")
    end
    
    should "be able to hook into a method invocation without replacing it completely" do
      mock.proxy(@person).full_name do |name|
        name.upcase
      end
      assert_equal "YUKIHIRO MATZ", @person.full_name      
    end
  end
end
#END:rr