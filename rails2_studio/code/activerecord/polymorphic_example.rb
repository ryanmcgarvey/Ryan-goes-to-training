class Tag < ActiveRecord::Base
  has_many :taggings
end

class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :taggable, :polymorphic => true
end

class Contact < ActiveRecord::Base
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :tags
end

class BlogPost < ActiveRecord::Base
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :tags
end
