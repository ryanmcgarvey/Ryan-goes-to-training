#START:test1
should "create with valid event" do
  # Valid event (doesn't matter if we supply enough attributes!)
  @event.expects(:save).with().returns(true)

  post :create, :event => @attributes

  assert_equal @event, assigns(:event)
  assert_not_nil flash[:notice]
  assert_redirected_to events_url
end
#END:test1

#START:test2
should "create with invalid event" do
  # Invalid event
  @event.should_receive(:save).returns(false)

  post :create, :event => @attributes

  assert_equal @event, assigns(:event)
  assert_nil flash[:notice]
  assert_response :success
  assert_template 'new'
end
#END:test2
