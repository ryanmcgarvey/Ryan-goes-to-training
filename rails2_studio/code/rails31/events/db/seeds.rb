# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Event.create!(
  :name => 'Advanced Ruby on Rails',
  :description => 
  %{
    Take your web application to the next level by mastering the cutting-edge 
    techniques used by experts to build killer Rails apps with confidence and 
    efficiency.
  },
  :image_location => 'advrailsstudio.gif',
  :starts_at => Time.mktime(2008, 10, 24, 9, 0),
  :location => 'Denver, CO',
  :capacity => 30,
  :price => 1350
)

Event.create!(
  :name => 'Advanced Ruby',
  :description => 
  %{
    Dive deep into the source of Ruby's power and learn advanced Ruby 
    features that will make you and your project shine.
  },
  :image_location => 'rubygroup.jpg',
  :starts_at => Time.mktime(2008, 11, 12, 9, 0),
  :location => 'Denver, CO',
  :capacity => 30,
  :price => 1350
)

Event.create!(
  :name => 'The Rails Edge',
  :description => 
  %{
     The Rails Edge is a unique conference where we bring some of the best 
     minds in the Rails and Ruby communities together with you in a single-track 
     environment, so that we can all sharpen our edge. We hope you'll join us!
  },
  :image_location => 'railsedge.jpg',
  :starts_at => Time.mktime(2008, 3, 25, 9, 0),
  :location => 'Reston, VA',
  :capacity => 100,
  :price => 695
)

Event.create!(
  :name => 'RailsConf',
  :description => 
  %{
     RailsConf is the official annual event for the growing Rails community.
     It's co-produced by Ruby Central, Inc. and O'Reilly Media Inc., and
     Chad Fowler is the program chair.
  },
  :image_location => 'railsconf.jpg',
  :starts_at => Time.mktime(2008, 5, 17, 9, 0),
  :location => 'Portland, OR',
  :capacity => 1200,
  :price => 456.00
)

Event.create!(
  :name => 'RubyConf',
  :description => 
  %{
     RubyConf is the official annual event for Rubyists.  It's a
     production of the fine folks at Ruby Central.
  },
  :image_location => 'rubyconf.jpg',
  :starts_at => Time.mktime(2008, 10, 20, 9, 0),
  :location => 'East Coast',
  :capacity => 300,
  :price => 123.00
)
    
Event.create!(
  :name => 'Photography Walkabout',
  :description => 
  %{
    Join James Duncan Davidson and friends for a walkabout of the camera-friendly 
    Portland Waterfront.  Our itinerary will be loose, but we'll spend a few hours 
    chatting, snapping, and generally having fun until the sun goes down and we 
    lose the good light.  After that, we'll probably grab a bite to eat.
  },
  :image_location => 'walkabout.jpg',
  :starts_at => Time.mktime(2008, 7, 24, 18, 30),
  :location => %{
    We'll meet near the Oregon Convention Center. From there, we'll walk 
    to the River and walk around Steel and Burnside bridges.
  },
  :capacity => 25,
  :price => 0
)

Event.create!(
  :name => 'Ruby User Group',
  :description => 
  %{
    Come meet fellow Rubyists and enjoy a technical talk by a local
    celebrity.  Pizza and pop provided.
  },
  :image_location => 'rubygroup.jpg',
  :starts_at => 10.days.from_now,
  :location => 'Columbus, OH',
  :capacity => 60,
  :price => 10
)

Event.create!(
  :name => 'Charity Bowl',
  :description => 
  %{
    Strike it rich for great causes by participating in 
    this bowling fundraiser held at the Bowling Hall of Fame.  
    Every pin you knock down counts!
  },
  :image_location => 'bowling.jpg',
  :starts_at => 30.days.from_now,
  :location => 'St. Louis, MO at the Bowling Hall of Fame',
  :capacity => 75,
  :price => 15
)

Event.create!(
  :name => 'Snowboarder Dream Ride',
  :description => 
  %{
     Take to the back-country with us for the ultimate 
     power day.  We'll meet at the base of Copper Mountain
     and take a snow cat up to the peak.
  },
  :image_location => 'snowboard.jpg',
  :starts_at => 60.days.from_now,
  :location => 'Copper Mountain, CO',
  :capacity => 10,
  :price => 99
)

Event.create!(
  :name => 'Scuba Pool Party',
  :description => 
  %{
    Meet other people interested in scuba diving, snorkeling, 
    and underwater exploration!
  },
  :image_location => 'scuba.jpg',
  :starts_at => 90.days.from_now,
  :location => 'San Diego, CA',
  :capacity => 75,
  :price => 0
)

User.create!(:name     => 'Test User',
             :email    => 'test@pragmaticstudio.com',
             :password => 'test')
