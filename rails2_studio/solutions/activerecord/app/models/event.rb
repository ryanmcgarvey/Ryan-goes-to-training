class Event < ActiveRecord::Base
  has_many :registrations
  has_many :paid_registrations
  has_many :reviews
  
  has_many :attendees, 
           :source => :user, 
           :through => :registrations,
           :order => 'users.name'

  validates_presence_of     :name, :image_location, :starts_at, :location
  
  validates_uniqueness_of   :name
  
  validates_numericality_of :price, :greater_than_or_equal_to => 0
  
  validates_numericality_of :capacity, :only_integer => true
  
  validates_length_of       :description, :minimum => 10
  validates :image_location, :image_location => true
                      
  validate :price_is_a_multiple_of_five_cents

  scope :free, where(:price => 0.0).order("name")
  scope :inexpensive, where("price < 100").order("price DESC")
  scope :big, where("capacity >= 200").order("capacity DESC")
  scope :recently_added, order("created_at").limit(3)
  scope :upcoming, lambda {|datetime=Time.now| where('starts_at >= ?', Time.now).order("starts_at")}
  
  # Returns all the event names which can be
  # handy for form selections, for example.
  def self.all_names
    all.map { |event| event.name }
  end
  
  def register(user)
    registration = registrations.build(:user => user)
    registration.save
  end
  
  def free?
    self.price.zero?
  end  
  
  # Returns the number of seats remaining.
  def spaces_remaining
    self.capacity - self.paid_registrations.size
  end
  
private
  
  # ===============
  # = Validations =
  # ===============
  
  def price_is_a_multiple_of_five_cents
    unless price && (price * 100) % 5 == 0
      errors.add(:price, "must be a multiple of 5 cents")
    end
  end                      
end
