class Album < ActiveRecord::Base
  def self.all_cached
    Rails.cache.fetch("all_albums") do
      all
    end
  end
end
