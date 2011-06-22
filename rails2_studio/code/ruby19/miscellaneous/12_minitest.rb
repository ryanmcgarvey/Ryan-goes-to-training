# test/unit replaced by minitest
require 'test/unit'
Test::Unit::TestCase.superclass
# => MiniTest::Unit::TestCase
puts MiniTest::Unit::TestCase.instance_methods.grep(/^assert/).sort
# assert
# assert_block
# assert_empty
# assert_equal
# assert_in_delta
# assert_in_epsilon
# assert_includes
# assert_instance_of
# assert_kind_of
# assert_match
# assert_nil
# assert_operator
# assert_raises
# assert_respond_to
# assert_same
# assert_send
# assert_throws
puts MiniTest::Unit::TestCase.instance_methods.grep(/^refute/).sort
# refute
# refute_empty
# refute_equal
# refute_in_delta
# refute_in_epsilon
# refute_includes
# refute_instance_of
# refute_kind_of
# refute_match
# refute_nil
# refute_operator
# refute_respond_to
# refute_same
