require 'test/unit'

module RPN
  Op = Struct.new(:symbol, :name, :precedence)
  OPERATORS = [
    Op.new(:+, 'plus',     1),
    Op.new(:-, 'minus',    1),
    Op.new(:*, 'multiply', 2),
    Op.new(:/, 'divide',   2)
  ]
  

  def enable
    OPERATORS.each do |op|
      alias_method op.name, op.symbol
      define_method(op.symbol) do |arg|
        rpn_push(self, arg, op)
        nil
      end
    end
    puts "here"
    @rpn_stack = []
  end
  
  def disable
    OPERATORS.each do |op|
      remove_method op.symbol
      alias_method op.symbol, op.name
    end
  end
  
  def rpn_stack
    @rpn_stack
  end
end
    
class Fixnum
 extend RPN
 def rpn_push(arg1, arg2, op)
   Fixnum.rpn_stack << arg1 << arg2 << op.symbol
 end
end

def rpn
  Fixnum.enable
  p Fixnum.rpn_stack
  yield ensure Fixnum.disable
  Fixnum.rpn_stack
end

class Tests < Test::Unit::TestCase
  def test_rpn
    assert_equal(3, 1 + 2)
    assert_equal([1, 2, :+],     rpn { 1 + 2 })
    assert_equal(7, 1 + 2 * 3)
    assert_equal([2, 3, :*, 1, :+], rpn { 1 + 2 * 3 })
  end
end