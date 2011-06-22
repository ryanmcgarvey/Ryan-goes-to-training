require 'test/unit'
require 'mocha'
class Event
end
class StubTest < Test::Unit::TestCase
#START:pass
def test_mocking_a_class_method
  event = Event.new
  Event.stubs(:find).with(1).returns(event)
  assert_equal event, Event.find(1)
end
#END:pass

#START:also_pass
def test_mocking_a_class_method
  event = Event.new
  Event.stubs(:find).with(1).returns(event)
end
#END:also_pass
end