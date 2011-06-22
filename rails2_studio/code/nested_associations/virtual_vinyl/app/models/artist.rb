#START:with_extra_albums
class Artist < ActiveRecord::Base 
#END:with_extra_albums

  validates_presence_of :name
  
  has_many :albums, :dependent => :destroy do
    def index_listing
      all(:order => "year")
    end
  end

  #START:reject_if
  all_blank = lambda { |attrs| attrs.all? { |_, v| v.blank? } }
  accepts_nested_attributes_for :albums, 
                                :allow_destroy => true, 
                                :reject_if => all_blank
  #END:reject_if
    
  named_scope :index_listing, :order => 'name'
     
  # START:with_extra_albums
  def with_extra_albums(extra=2)
    extra.times { albums.build }
    self
  end
end
#END:with_extra_albums
