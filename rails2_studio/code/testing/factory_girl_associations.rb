require_relative 'factory_girl_definitions'

#START:associations
class UserTest < Test::Unit::TestCase
  Factory.define :user do |u|
    u.first_name 'Joe'
    u.last_name  'Blow'
  end
 
  Factory.define :article do |article|
    article.title "Hello World!"
    article.author do |author| 
      author.association(:user, :first_name => "William", :last_name => "Shakespeare")
    end
  end
 
  context "lazy attributes" do
    should "construct email address" do
      article = Factory(:article)
      assert_equal article.author.first_name, "William"
    end
  end
end
#END:associations
