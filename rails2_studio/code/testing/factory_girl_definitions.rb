require 'test/unit'
require 'shoulda'

require 'factory_girl'

class Resource
  def self.each
    yield [1,2,3] #whatever
  end
end
class Article
  attr_accessor :title, :author
  def save!;  end
end

class User
  attr_accessor :first_name,:last_name, :group, :email
  def save!;  end
  def can_edit?(*); true; end
end