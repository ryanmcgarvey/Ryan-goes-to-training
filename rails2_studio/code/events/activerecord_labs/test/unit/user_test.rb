require_relative '../test_helper'

class UserTest < ActiveSupport::TestCase
    
  setup do
    @valid_attributes = { 
        :name     => "Wilma Flintstone",
        :email    => 'wilma@flintstones.com', 
        :password => 'secret', 
        :password_confirmation => 'secret'
      }
    
    @user = User.new(@valid_attributes)
  end

  test "creating a new user" do
    assert_difference 'User.count', 1 do
      user = User.create(@valid_attributes)
    end
  end
  
  test "not valid without required fields" do
    user = User.new
    assert !user.valid?
    [:name, :email].each do |field|
      assert !user.errors[field].empty?, field.to_s
    end
  end
    
  test "which fields are required" do
    [:name, :email].each do |field|
      u = User.new(@valid_attributes.merge(field => nil))
      assert !u.valid?, "#{field} should be invalid"
      assert !u.errors[field].empty?
    end
  end

  test "require valid email" do
    @user.email = nil
    
    @user.email = "abc"
    assert !@user.valid?

    @user.email = "abc@de"
    assert @user.valid?, @user.errors.full_messages.to_sentence
  end

  test "require password confirmation" do
    @user.password_confirmation = ''
  
    assert !@user.valid?
    assert !@user.errors[:password].empty?
  end

  test "require unique email" do
    @user.email = users(:fred).email

    assert !@user.valid?
    assert !@user.errors[:email].empty?
  end

  test "require reasonable password length" do
    @user.password, @user.password_confirmation = "123"

    assert !@user.valid?
    assert_equal "is too short (minimum is 4 characters)", @user.errors[:password].to_sentence
  end  

  test "authenticate" do
    assert_equal users(:fred), User.authenticate(users(:fred).email, 'test')
  end

end