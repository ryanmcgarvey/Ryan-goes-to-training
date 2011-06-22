class Post < ActiveRecord::Base
  before_validation :generate_slug
  
  default_scope where("published_at is not null").order("published_at DESC")

  #scope :recent, order('created_at DESC').limit(5)
  
  scope :recent, 
          lambda { |limit=5| 
            order('created_at DESC').limit(limit)
          }
              
  scope :archives, 
          lambda { where('published_at < ?', 10.days.ago) }

  scope :published,
          where("published_at is not null").order("published_at DESC")

  scope :drafts,
          where("published_at is null").order("created_at DESC")
      
  scope :comments_enabled,
          published.where(:comments_enabled => true).order("published_at DESC")
          
  scope :viewed_at_least,
          lambda { |views| published.where('view_count >= ?', views) }
                    
  # def self.recent(limit = 5)
  #   order('created_at DESC').limit(limit)
  # end
  
private

  def generate_slug
    if slug.blank?
      unless self.slug = slugorize(self.title)
        errors[:base] << "Unable to slugorize: #{self.title}"
        return false
      end
    end
  end
  
  def slugorize(text)
    text.downcase.gsub(/[^a-zA-Z0-9\-]/, '')
  end
  
end
