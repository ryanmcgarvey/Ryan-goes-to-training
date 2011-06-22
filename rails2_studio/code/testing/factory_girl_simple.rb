require 'test/unit'
require 'shoulda'

require 'factory_girl'

class Resource
  def self.each
    yield [1,2,3] #whatever
  end
end
class User
  attr_accessor :name, :group, :email
  def save!;  end
  def can_edit?(*); self.group == "admin"; end
end

#START:factory
class UserTest < Test::Unit::TestCase
  Factory.define :user do |u|
    u.name  'John'
    u.email "john@example.org"
    u.group "lusers"
  end

  context "in the admin group" do
    setup do
      @user = Factory(:user, :group => "admin")
    end
    should "have rights to all resources" do
      Resource.each do |resource|
        assert @user.can_edit?(resource), "#{@user.name} should have rights to #{resource}"
      end
    end
  end
end
#END:factory