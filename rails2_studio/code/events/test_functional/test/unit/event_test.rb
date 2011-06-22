require 'test_helper'

class EventTest < ActiveSupport::TestCase

  test "Events know when they are free" do
    event = Event.new

    event.price = 0
    assert event.free?

    event.price = 1
    assert !event.free?
  end 

  test "Registering uses up capacity" do
    event = Event.new(:capacity => 10)
    assert_difference('event.spaces_remaining', -1) do
      event.register(User.new)
    end
  end 
  
  test "Upcoming events deals with past, present, and future" do
    upcoming_event 1.day.ago,       0
    upcoming_event 1.hour.from_now, 1    
    upcoming_event 1.day.from_now,  1    
  end

private

  def upcoming_event(starts_at, expected_count)
    Event.delete_all
    e = Event.new(:name           => "Test Event",
                  :description    => "Just a test...",
                  :price          => 5.00, 
                  :location       => "Denver, CO",
                  :image_location => "event.jpg",
                  :capacity       => 10,
                  :starts_at      => starts_at)
    assert e.save, e.errors.full_messages.to_sentence
    assert_equal expected_count, Event.find_upcoming_events.size
  end
end
