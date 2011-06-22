require_relative '../test_helper'

class EventTest < ActiveSupport::TestCase

  setup do
    @valid_attributes = { 
        :name           => "Test Event",
        :description    => "Join us...",
        :price          => 5.00, 
        :location       => "Denver, CO",
        :image_location => "event.jpg",
        :capacity       => 10,
        :starts_at      => 1.hour.from_now
      }

    @event = Event.new(@valid_attributes)
  end

  test "we can create a new valid event" do
    assert_difference 'Event.count', 1 do
      event = Event.create(@valid_attributes)
    end
  end

  test "an event is invalid without the required fields" do
    [:name, :description, :image_location, :starts_at, :location, :capacity].each do |field|
      e = Event.new(@valid_attributes.merge(field => nil))
      assert !e.valid?, "#{field} should be invalid"
      assert !e.errors[field].empty?
    end
  end

  # test "an event's name must be unique" do
  #   @event.name = events(:rails_studio).name
  # 
  #   assert !@event.valid?
  #   assert @event.errors[:name].empty?
  # end

  test "we can tell when an event is free" do  
    event = Event.new                           

    event.price = 0.00
    assert event.free?

    event.price = 1.00
    assert !event.free?
  end

  test "test upcoming events for days in the past and future" do
    upcoming_event 1.day.ago, 0
    upcoming_event 1.hour.from_now, 1    
    upcoming_event 1.day.from_now, 1    
  end

  test "price should be 0 or more" do
    @event.price = -1

    assert !@event.valid?
    assert @event.errors[:price]

    @event.price = 0
    assert @event.valid?, @event.errors.full_messages.to_sentence
  end

private

  def upcoming_event(starts_at, expected_count)
    Event.delete_all
    e = Event.new(@valid_attributes.merge(:starts_at => starts_at))
    assert e.save, e.errors.full_messages.to_sentence
    assert_equal expected_count, Event.find_upcoming_events.size
  end                                                                                                                                       
end
