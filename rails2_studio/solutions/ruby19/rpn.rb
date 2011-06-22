require 'strscan'

class RPN
  def evaluate(expression)
    @stack = []
    execute(expression)
    @stack.pop
  end                  
  
  def execute(expression)
    scanner = StringScanner.new(expression) 
    
    syntax = {
      /\s+/    => ->*       {},
      /\-?\d+/ => ->(match) { push(Integer(match)) },
      /\+/     => ->*       { push(pop  + pop) },
      /-/      => ->*       { push(-pop + pop) },
      /\*/     => ->*       { push(pop  * pop) },
      /\//     => ->*       { a = pop; b = pop; push(b / a) },
      /dup\b/  => ->*       { a = pop; push(a); push(a) },
      /.*/     => ->(val)   { fail "Unrecognized token(s): #{val}" }
    }
    
    until scanner.eos?
      syntax.each do |pattern, code|
        if matched = scanner.scan(pattern)
          code[matched]
          break
        end
      end
    end
  end
  
  def push(val)
    @stack.push(val)
  end
  
  def pop
    fail "Empty stack" if @stack.empty?
    @stack.pop
  end
  
end

require 'test/unit'
require 'shoulda'

class TestRPN < Test::Unit::TestCase

  [
    [                 "1",  1     ],
    [                 "0",  0     ],
    [                "-1",  -1    ],
    [             "1 1 +",  2     ],
    [             "1 2 +",  3     ],
    [            "1 -2 +",  -1    ],
    [         "1 2 3 * +",  7     ],
    [           "3 dup *",  9     ],
    [            " 6 3 /",  2     ],
    [ "3 dup 4 dup * + *",  3 * 19] 
  ].each do |expression, expected|
    context "#{expression.inspect}" do
      should "evaluate to #{expected}" do
        assert_equal expected, RPN.new.evaluate(expression)
      end
    end
  end
  
  context "an invalid expression" do
    should "raise an exception" do
      assert_raises(RuntimeError) do
        RPN.new.evaluate("wibble")
      end
    end
  end
  
  context "popping the stack when empty" do
    should "raise an exception" do
      assert_raises(RuntimeError) do
        RPN.new.evaluate("1 +")
      end
    end
  end
end
