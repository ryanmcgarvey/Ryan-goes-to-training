#START:authenticate2
#START:authenticate1
class User < ActiveRecord::Base
  has_secure_password  
#END:authenticate1
  
  validates_presence_of :password, :on => :create
  validates_length_of   :password, :minimum => 4
  
#END:authenticate2
  
  attr_accessible :name, :email, :password, :password_confirmation
  
  has_many :registrations
  has_many :events, :through => :registrations
  
  validates_presence_of     :name, :email
  validates_uniqueness_of   :email
  validates_format_of       :email, :with => /(\S+)@(\S+)/, :allow_nil => true
                  
  # Returns a non-nil user if a user exists for the given
  # email and password, or nil if the user doesn't exist.                 
#START:authenticate2 
  def self.authenticate(email, password)
    user = self.find_by_email(email)
    (user && user.authenticate(password)) ? user : nil    
  end
#END:authenticate2
  
  def to_xml(options = {})
    default_except = [:password_digest]
    options[:except] = (options[:except] || []) + default_except
    super(options)
  end
  
#START:authenticate2
#START:authenticate1
end
#END:authenticate1
#END:authenticate2
