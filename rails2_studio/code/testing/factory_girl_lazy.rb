require_relative 'factory_girl_definitions'

#START:lazy
class UserTest < Test::Unit::TestCase
  Factory.define :user do |u|
    u.first_name 'Joe'
    u.last_name  'Blow'
    u.email {|a| "#{a.first_name}.#{a.last_name}@example.com".downcase }
  end

  context "lazy attributes" do
    should "construct email address" do
      assert_equal "joe.blow@example.com", Factory(:user).email
    end
  end
end
#END:lazy
