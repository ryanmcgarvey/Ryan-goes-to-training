#START:post_test
class PostTest < Test::Unit::TestCase
  fixtures :all

  should_belong_to :user
  should_have_many :tags, :through => :taggings

  should_validate_uniqueness_of :title
  should_validate_presence_of :body, :message => /wtf/
  should_validate_presence_of :title
  should_validate_numericality_of :user_id
end
#END:post_test
#START:user_test
class UserTest < Test::Unit::TestCase
  should_have_many :posts

  should_not_allow_values_for :email, "blah", "b lah"
  should_allow_values_for :email, "a@b.com", "asdf@asdf.com"
  should_ensure_length_in_range :email, 1..100
  should_ensure_value_in_range :age, 1..100
  should_not_allow_mass_assignment_of :password
end
#END:user_test