require_relative 'factory_girl_definitions'

#START:inheritance
class UserTest < Test::Unit::TestCase
  Factory.define :user do |u|
    u.first_name 'Joe'
    u.last_name  'Blow'
    u.email {|a| "#{a.first_name}.#{a.last_name}@example.com".downcase }
  end

  Factory.define :admin_user, :parent => :user do |u|
    u.group "admin"
  end

  context "inheritance" do
    should "combine inherited and derived attribute values" do
      assert_equal "admin", Factory(:admin_user).group
      assert_equal "Joe", Factory(:admin_user).first_name
    end
  end
end
#END:inheritance

