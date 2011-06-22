require 'test/unit'
require 'mocha'
class Event
end
class MockTest < Test::Unit::TestCase
#START:pass
def test_mocking_a_class_method
  event = Event.new
  Event.expects(:find).with(1).returns(event)
  
  assert_equal event, Event.find(1)
end
#END:pass

#START:fail
def test_mocking_a_class_method
  event = Event.new
  Event.expects(:find).with(1).returns(event)
  
  # then never call find!
end
#END:fail
end