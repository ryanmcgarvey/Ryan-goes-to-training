#START:oneway
class Friendship < ActiveRecord::Base
  belongs_to :person
  belongs_to :friend, 
             :class_name => "Person", 
             :foreign_key => 'friend_id'
#END:oneway

  after_create do |record|
    record.class.
      find_or_create_by_person_id_and_friend_id(
        record.friend.id, 
        record.person.id)
  end
  
  after_destroy do |record|
    record.class.find_by_person_id_and_friend_id(
      record.friend.id, 
      record.person.id).destroy rescue nil
  end
#START:oneway  
end
#END:oneway
   
#START:person
class Person < ActiveRecord::Base
  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships
end
#END:person
