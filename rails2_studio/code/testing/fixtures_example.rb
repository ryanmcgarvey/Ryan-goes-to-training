class UserTest < Test::Unit::TestCase
  context "in the admin group" do
    @user = users(:chuck)
  end
  
  should "have rights to all resources" do
    Resource.each do |resource|
      assert @user.can_edit?(resource), "#{@user.name} should have rights to #{resource}"
    end
  end
end