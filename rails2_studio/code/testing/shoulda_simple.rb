require 'rubygems'
require 'test/unit'
require 'shoulda'

class User
  attr_accessor :name, :profile
  def full_name
    "John Doe"
  end
  
  def has_profile?
    !profile.nil?
  end
  
  def initialize(hash)
    hash.each do |k, v|
      send("#{k}=", v)
    end
  end
  
  def self.find(whatever)
    User.new(:name => "Chad")
  end
end

Profile = User

#START:example
class UserTest < Test::Unit::TestCase
  context "A User instance" do
    setup do
      @user = User.first
    end
    
    should "return its full name" do
      assert_equal "John Doe", @user.full_name
    end
    
    context "with a profile" do
      setup do
        @user.profile = Profile.first
      end
      should "return true when sent #has_profile?" do
        assert @user.has_profile?
      end
    end
  end
end
#END:example
# Shoulda is Copyright 2006-2008 Tammer Saleh, Thoughtbot.
