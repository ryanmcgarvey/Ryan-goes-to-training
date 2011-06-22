require 'minitest/autorun'
require 'minitest/spec'
class Pizza
  def initialize(*toppings)
    @toppings = toppings
  end
  
  def good?
    true if @toppings.include?("Pepperoni")
  end
end

class PizzaSpec < MiniTest::Spec
  it "should taste good if it has pepperoni" do
    Pizza.new("Pepperoni").good?.must_equal true
  end
end